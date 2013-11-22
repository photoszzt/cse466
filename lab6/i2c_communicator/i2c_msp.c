/* --COPYRIGHT--,BSD_EX
 * Copyright (c) 2012, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *******************************************************************************
 * 
 *                       MSP430 CODE EXAMPLE DISCLAIMER
 *
 * MSP430 code examples are self-contained low-level programs that typically
 * demonstrate a single peripheral function or device feature in a highly
 * concise manner. For this the code may rely on the device's power-on default
 * register values and settings such as the clock configuration and care must
 * be taken when combining code from several examples to avoid potential side
 * effects. Also see www.ti.com/grace for a GUI- and www.ti.com/msp430ware
 * for an API functional library-approach to peripheral configuration.
 *
 * --/COPYRIGHT--*/
//******************************************************************************
//  MSP430F20xx Demo - I2C Slave Receiver, single byte
//
//  Description: I2C Slave communicates with I2C Master using
//  the USI. Master data should increment from 0x00 with each transmitted byte
//  which is verified by the slave.
//  LED off for address or data Ack; LED on for address or data NAck.d by the slave.
//  ACLK = n/a, MCLK = SMCLK = Calibrated 1MHz
//
//  ***THIS IS THE SLAVE CODE***
//
//                  Slave                      Master
//                                      (msp430x20x3_usi_07.c)
//               MSP430F20x2/3              MSP430F20x2/3
//             -----------------          -----------------
//         /|\|              XIN|-    /|\|              XIN|-
//          | |                 |      | |                 |
//          --|RST          XOUT|-     --|RST          XOUT|-
//            |                 |        |                 |
//      LED <-|P1.0             |        |                 |
//            |                 |        |             P1.0|-> LED
//            |         SDA/P1.7|<-------|P1.7/SDA         |
//            |         SCL/P1.6|<-------|P1.6/SCL         |
//
//  Note: internal pull-ups are used in this example for SDA & SCL
//
//  Z. Albus
//  Texas Instruments Inc.
//  May 2006
//  Built with CCE Version: 3.2.0 and IAR Embedded Workbench Version: 3.41A
//******************************************************************************
#include <msp430f2013.h>

// Joseph Godlewski and Zhiting Zhu
// joe3701 and zzt0215
// Lab 6 final part
char data = 0x00;
char SLV_Addr = 0x90;                  // Address is 0x48<<1 for R/W
int I2C_State = 0;                     // State variable

int d = 0; // direction
int b = 1; // amount to change each time for CCR1

// MSP430 is the slave receiver. It reads data sent by master and set the CCR0
// to 4*data. Then the led blinking rate will change according to the resulting
// CCR0.
int main(void)
{
	WDTCTL = WDTPW + WDTHOLD;            // Stop watchdog
	if (CALBC1_1MHZ==0xFF)			     // If calibration constants erased
	{
		while(1);                        // do not load, trap CPU!!
	}
	DCOCTL = 0;                          // Select lowest DCOx and MODx settings
	BCSCTL1 = CALBC1_1MHZ;               // Set DCO
	DCOCTL = CALDCO_1MHZ;

	P1OUT = 0xC0;                        // P1.6 & P1.7 Pullups
	P1REN |= 0xC0;                       // P1.6 & P1.7 Pullups
	P1DIR = 0x0C;                        // P1.2 and P1.3 output
	P2OUT = 0;
	P2DIR = 0xFF;

	P1SEL |= 0x0C;                       // P1.2 and P1.3 TA1/2 options
	CCR0 = 1000;
	CCTL0 = CCIE;                        // CCR0 interrupt enabled
    CCTL1 = OUTMOD_7;                    // CCR1 reset/set
    CCR1 = 1;                            // CCR1 PWM duty cycle
    TACTL = TASSEL_2 + MC_1;             // SMCLK, up mode, divide by 2

	USICTL0 = USIPE6+USIPE7+USISWRST;    // Port & USI mode setup
	USICTL1 = USII2C+USIIE+USISTTIE;     // Enable I2C mode & USI interrupts
	USICKCTL = USICKPL;                  // Setup clock polarity
	USICNT |= USIIFGCC;                  // Disable automatic clear control
	USICTL0 &= ~USISWRST;                // Enable USI
	USICTL1 &= ~USIIFG;                  // Clear pending flag
	_EINT();

	while(1)
	{
		LPM0;                              // CPU off, await USI interrupt
		_NOP();                            // Used for IAR
	}
}

//******************************************************************************
// USI interrupt service routine
//******************************************************************************
#pragma vector = USI_VECTOR
__interrupt void USI_TXRX (void)
{
	if (USICTL1 & USISTTIFG)             // Start entry?
	{
		I2C_State = 2;                   // Enter 1st state on start
	}

	switch(I2C_State)
	{
	case 0: // Idle, should not get here
		break;

	case 2: // RX Address
		USICNT = (USICNT & 0xE0) + 0x08; // Bit counter = 8, RX address
		USICTL1 &= ~USISTTIFG;           // Clear start flag
		I2C_State = 4;                   // Go to next state: check address
		break;

	case 4: // Process Address and send (N)Ack
		USICTL0 |= USIOE;               // SDA = output
		if (USISRL == SLV_Addr)         // Address match?
		{
			USISRL = 0x00;              // Send Ack
			I2C_State = 8;              // Go to next state: RX data
		}
		else
		{
			USISRL = 0xFF;              // Send NAck
			P1OUT |= 0x01;              // LED on: error
			I2C_State = 6;              // Go to next state: prep for next Start
		}
		USICNT |= 0x01;                 // Bit counter = 1, send (N)Ack bit
		break;

	case 6: // Prep for Start condition
		USICTL0 &= ~USIOE;              // SDA = input
		SLV_Addr = 0x90;                // Reset slave address
		I2C_State = 0;                  // Reset state machine
		break;

	case 8: // Receive data byte
		USICTL0 &= ~USIOE;              // SDA = input
		USICNT |=  0x08;                // Bit counter = 8, RX data
		I2C_State = 10;                 // Go to next state: Test data and (N)Ack
		break;

	case 10:// Check Data & TX (N)Ack
		// Get the data and set CCR0
		CCR0 = USISRL << 2;

		// clean up
		USICTL0 |= USIOE;     	        // SDA = output
		USISRL = 0x00;       	        // Send Ack
		USICNT |= 0x01;                 // Bit counter = 1, send (N)Ack bit
		I2C_State = 6;                  // Go to next state: prep for next Start
		break;
	}

	USICTL1 &= ~USIIFG;                 // Clear pending flags
}

// Timer A0 interrupt service routine
#pragma vector=TIMERA0_VECTOR
__interrupt void Timer_A (void)
{
    CCR1 = CCR1 + b;
    if (CCR1 >= CCR0 - 1 && d == 0) {  // change direction to count down
        d = 1;
        b = b*-1;
    } else if (CCR1 <= 1 && d == 1) {  // change direction to count up
        d = 0;
        b = b*-1;
    }
}
