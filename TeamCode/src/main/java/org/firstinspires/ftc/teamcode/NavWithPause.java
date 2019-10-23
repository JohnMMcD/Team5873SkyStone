package org.firstinspires.ftc.teamcode;

import com.qualcomm.robotcore.eventloop.opmode.LinearOpMode;
import com.qualcomm.robotcore.eventloop.opmode.OpMode;
import com.qualcomm.robotcore.eventloop.opmode.TeleOp;
import com.qualcomm.robotcore.util.ElapsedTime;

@TeleOp(name="Nav with Pause1", group="Linear Opmode")
public class NavWithPause extends LinearOpMode {

    /* Declare OpMode members. */
    HardwarePushbot5873         robot   = new HardwarePushbot5873();   // Use a Pushbot's hardware
    private ElapsedTime     runtime = new ElapsedTime();


    static final double     FORWARD_SPEED = 0.6;
    static final double     TURN_SPEED    = 0.5;

    @Override
    public void runOpMode() {

        /*
         * Initialize the drive system variables.
         * The init() method of the hardware class does all the work here
         */
        robot.init(hardwareMap);

        // Send telemetry message to signify robot waiting;
        telemetry.addData("Status", "Ready to run");    //
        telemetry.update();

        // Wait for the game to start (driver presses PLAY)
        waitForStart();

        // Step through each leg of the path, ensuring that the Auto mode has not been stopped along the way

        // Step 1:  Drive forward for a small number of seconds
        robot.leftDrive.setPower(FORWARD_SPEED);
        robot.rightDrive.setPower(FORWARD_SPEED);
        runtime.reset();
        while (opModeIsActive() && (runtime.seconds() < 1.5)) {
            telemetry.addData("Path", "Leg 1: %2.5f S Elapsed Power: %.2f ", runtime.seconds(), FORWARD_SPEED);
            telemetry.update();
        }
        // Step 1 end: stop the robot
        robot.leftDrive.setPower(0);
        robot.rightDrive.setPower(0);

        // Insert pause
        while (opModeIsActive() && (!gamepad1.x)) {
            telemetry.addData("Pause", "Press x to continue %.2f", runtime.seconds());
            telemetry.update();
        }

        // Step 2: Turn 90 degrees and stop
        robot.leftDrive.setPower(-TURN_SPEED);
        robot.rightDrive.setPower(TURN_SPEED);
        runtime.reset();
        while (opModeIsActive() && (runtime.seconds() < 6.0)) {
            telemetry.addData("Path", "Leg 2 Turn: %2.5f S Elapsed", runtime.seconds());
            telemetry.update();
        }
        robot.leftDrive.setPower(0);
        robot.rightDrive.setPower(0);
/*        runtime.reset();
        while (opModeIsActive() && (runtime.seconds() < 3.0)) {
            telemetry.addData("Path", "Stopping %.2f", runtime.seconds());
            telemetry.update();
        }
*/
        // Insert pause
        while (opModeIsActive() && (!gamepad1.x)) {
            telemetry.addData("Pause", "Press x to continue %.2f", runtime.seconds());
            telemetry.update();
        }


        // Step 3:  Drive forwards to sky bridge
        robot.leftDrive.setPower(FORWARD_SPEED);
        robot.rightDrive.setPower(FORWARD_SPEED);
        runtime.reset();
        while (opModeIsActive() && (runtime.seconds() < 2.5)) {
            telemetry.addData("Path", "Leg 3: %2.5f S Elapsed", runtime.seconds());
            telemetry.update();
        }
        // Step 3 end: stop the robot
        robot.leftDrive.setPower(0);
        robot.rightDrive.setPower(0);

        // Step 4 end: stop the robot
        robot.leftDrive.setPower(0);
        robot.rightDrive.setPower(0);

        telemetry.addData("Path", "Complete");
        telemetry.update();
        sleep(1000);
    }
}