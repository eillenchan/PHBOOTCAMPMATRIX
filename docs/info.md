<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This project uses a simple glyph matrix system to display custom text on a VGA-style output. Each character is stored as a small pixel pattern in a glyph ROM, where every row of the character is represented using binary values. The design checks the current pixel position, selects the correct character from the message, and turns each pixel on or off depending on the stored glyph data. For this project, the displayed text includes my name and “PH BootCamp” as part of the IEEE Open Silicon Cohort 1 activity.

## How to test

To test the project, run the Verilog design using a simulator or the TinyTapeout test environment. After compiling the design, observe the VGA output or waveform to confirm that the glyph patterns are being displayed correctly. The expected output should show the programmed text, including my name and “PH BootCamp,” using the custom glyph matrix. You may also modify the character sequence in the code to check if different letters are rendered properly.

## External hardware

No external hardware is required for the basic simulation of this project. The design can be tested using the TinyTapeout simulation tools or a Verilog simulator. If implemented on actual hardware, a VGA-compatible display or supported output interface may be used to view the glyph matrix output.
