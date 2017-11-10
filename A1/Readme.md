Convert a number from one base to another
Language

This assignment has to be completed using the Eiffel Programming Language. The documentation can be found at https://www.eiffel.org/documentation (Links to an external site.)Links to an external site.. References can also be found in the References page.

 
Objective

Given a non-negative integer in base LaTeX: aa from the user, convert it to a base LaTeX: bb specified by the user and display the result. Annotate the program with appropriate pre-conditions, post-conditions, loop invariants, and object invariants.

 
Description

    Define a class NUM, with at least the following members:
        An INTEGER_32 array, to store a number
        The base of the number, an INTEGER_32
    There could be other members or methods as per your requirements (for example, to store the size of the array). The input, processing, and output should be done with members of this class.
    This class will be used to store the representations of a number in a specified base.
    All integers in this problem statement are represented in base 10. The values stored in the array in the NUM object must also be in their base 10 representations. For example, for base 16, to represent C, the array element would contain 12.
    To convert a number from a base 'a' to a base 'b', the following steps must be followed:
        Convert from base 'a' to base 10.
        Convert from base 10 to base 'b'.
    The number in base 10 must be stored as a INTEGER_32 value.
    If either the original base or the target base is 10, then the problem can be solved in one step.
    Either by creating a separate class, or in the root class, define methods for the following:
        Conversion of a NUM from any base to base 10 : This accepts a NUM as the argument, and returns the equivalent in base 10 as an INTEGER_32.
        Conversion of a NUM from base 10 to any base : This accepts a INTEGER_32 number in base 10 and a target base INTEGER_32 as arguments, and returns the equivalent NUM in the specified base.
        A high-level method that performs the conversion by calling these methods.
        Additional methods may be defined as required.
    The following constraints must be enforced:
        The input and output base should be in the range 1 - 16 (both inclusive)
        The maximum length of the representation of a number in any base must be 15.
        Input must be a non-negative integer.
    The following assumptions can be made (no need for validation of these in the program, no input violating these assumptions will be given):
        Any otherwise valid input, when converted to base 10, can fit in a 32-bit integer.
    When the base is greater than 10, the symbols 'A', 'B', etc. are usually used to represent symbols for 10, 11, etc. In the array, however, these integers can be stored directly.
    The primary objective is to understand design by contract. Please ensure to annotate the program with as many non-trivial and trivial pre-conditions, post-conditions, and invariants as possible.
    Any clarifications must be addressed to the instructor via Canvas and it should be cc’ed to all the TAs.

 
Input

    The input should be taken from STDIN.
    The input to the program is to be given in the following format:
        The first line contains the number of test cases 'T'. 'T' test cases follow, each described as below. Each test case consists of three lines.
        The first line of a test case contains the original base, 'a', followed by a space, followed by the target base 'b'.
        The second line contains the length of the input (number of characters) in this base, 'n'.
        The third line contains n consecutive symbols, which form the input number in base 'a'.
    In the input, the symbols 'A', 'B', till 'F', will be used to represent 10, 11, till 15.

 
Output

    The output should be given to STDOUT.
    If the input was valid, and the converted number was within the limit on the size, the output should be as follows:
        A single line containing the number in base 'b'.
    If the input was invalid, or the output size exceeded the maximum allowed size, the output should be as follows:
        The exact messsage 'INVALID' (without quotes).
    The output format must be strictly followed. No other output should be given, including trailing newlines. Evaluation will be done using automated scripts. Marks will be deducted for deviating from the format. In particular, do not print messages like "Enter the number" etc.

 
Example

Input

4

2 8

4

1010

2 100

4

1010

10 3

2

20

3 4

4

-1A2

 

Output

12

INVALID

202

INVALID