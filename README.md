RobotSimulator
==============

Basic Robot Simulator code exercise

Usage
-----

CLI:

    ruby -Ilib lib/robot\_simulator.rb

Test:

    rspec


Design Decisions
--------------

Despite being a simple problem, there were many choices to make around appropriate abstraction, which often conflicted between designing for the current implementation, and considering future enhancements.

I have gone with a mixture and will explain some of them here.

CLI currently there is tight coupling throughout the app for a CLI interface. Not only does the initial robot_simulator.rb provide a file check wrapper to initialise the interface, but it passes the commands through as command strings which are expected by the controller, and also the commands which contain the matching logic along with the expectation that after a match the string will be passed through. This is obviously a severe restriction if it were desired to be used as a more conventional library. This wasn't so much a choice as an evolution. The steps required to remove this coupling are fairly simple, and it was simply a choice not to take those steps until they are required. For example, the execute(...)s could be renamed to execute_string to retain the CLI ability, and execute(...) be re-written to expect a variable number of arguments, with perhaps some convenience conversion from strings to numbers which would allow, for example, the regexp to be used to extract multiple arguments but to be passed through blindly without throwing errors.

There was a balance to find for scope of information. For example, does a table store the robot that is on it, where are the coordinates stored for the robot, the table dimensions, where does the logic for a move live. 

The more thought I gave this the more it appeared that to be future proof the logic would need to be very separated, and I felt that distracted from the current implementation, and was better left for a refactor based on future enhancements. Initially the "object" idea was a table knew of the objects on it, and those "robots" had a move that could be executed which they would blindly attempt to do. But other than reporting there wasn't much for the table to do. So it became a mere 2d wrapper for its boundaries, and validating it contained a point. Similarly, the robot moved to mimic a real world object, and so stored it's spacial co-ordinates including heading, and handled its own rotating. It still contains its own idea of a move, but this is as a request/desire, which is actioned by an external force.

So the controller was born, as were the commands which it used. I went with an inheritance structure for the commands mainly because I wanted them to self register with the controller when they were instantiated, and if more commands were desired it required merely a REGEXP for the CLI match, and then an implementation of the execute with access to the robot and table. I gave some consideration to the aforementioned tight coupling of string commands versus method parameters, and concluded that it would be a simple refactor if needed to support multiple execute styles. Given I wanted to retain the command object scope support for matching a string, adding this in now would have just increased complexity for no immediate gain.

I did receive feedback that this inheritance was quite restrictive, having used it for what could essentially be considered an attribute. I fell into a "this feels clever" trap, and was a little excited to use the recently learned syntax for ruby inheritance, the trickery for self-registration and to have an abstract class. It is not the best choice for future flexibility. It is *neat* for the current implementation so I have left it as it. A modular approach using mixing and fully named methods for commands are one option for better flexibility, removing the unnecessary and restrictive inheritance, and leveraging the powerful ruby-way of mixins, which I have read a little on, but really need to put some time aside to working through some actual examples to get a good feel for them.

Tests are lacking for the user view CLI. They mimic the actual CLI by passing strings directly to the controller. This has caught me out with a couple of commits when in the swing of TDD, but having written something to break the untested CLI. I want to find a way to test that well but haven't found a good solution, and have been spending my time on rails learning I feel is more important. I expect it will involve rebinding STDIN and STDOUT and either tricking the FILE check in the module to trigger, or better, moving that out to an actual binary in /bin, effectively making robot_simulator.rb redundant and controller.rb being the new lead. It remains a flaw in the test suite that needs to be remembered when editing robot_simulator.rb and something for which a testing solution should be found.

I think there's a good base for adding in functionality, and a small enough scope for easy refactoring if more complicated requirements are added in.

Original Specifications
-----------------------

The application is a simulation of a toy robot moving on a square
tabletop, of dimensions 5 units x 5 units. * There are no other
obstructions on the table surface. * The robot is free to roam around
the surface of the table, but must beprevented from falling to
destruction. Any movement that would result in the robot falling from
the table must be prevented, however further valid movement commands
must still be allowed.

Create an application that can read in commands of the following
form:

+ PLACE X,Y,F MOVE LEFT RIGHT REPORT

  - PLACE will put the toy robot on the table in position X,Y and
    facing NORTH, SOUTH, EAST or WEST.

    * The origin (0,0) can be considered to be the SOUTH WEST most
      corner.
    * The first valid command to the robot is a PLACE command,
      after that, any sequence of commands may be issued, in any order,
      including another PLACE command.i
    * The application should discard all commands in the sequence until
      a valid PLACE command has been executed.

  - MOVE will move the toy robot one unit forward in the direction
    it is currently facing.

  - LEFT and RIGHT will rotate the robot 90 degrees in the specified
    direction without changing the position of the robot.

  - REPORT will announce the X,Y and F of the robot. This can be in
    any form, but standard output is sufficient.

+ A robot that is not on the table can choose the ignore the MOVE,
LEFT, RIGHT and REPORT commands.

+ Input can be from a file, or from standard input, as the developer
chooses.

+ Provide test data to exercise the application.

**Constraints:**

+   The toy robot must not fall off the table during movement. This
    also includes the initial placement of the toy robot.

+   Any move that would cause the robot to fall must be ignored.

Example Input and Output:

    PLACE 0,0,NORTH
    MOVE
    REPORT
    Output: 0,1,NORTH

    PLACE 0,0,NORTH
    LEFT
    REPORT
    Output: 0,0,WEST

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT
    Output: 3,3,NORTH


Deliverables: *The source files, the test data and any test code.* It
is not required to provide any graphical output showing the movement
of the toy robot.

