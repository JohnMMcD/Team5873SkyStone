package org.firstinspires.ftc.teamcode;

import com.qualcomm.robotcore.eventloop.opmode.LinearOpMode;
import com.qualcomm.robotcore.eventloop.opmode.TeleOp;
import com.qualcomm.robotcore.hardware.DcMotor;
import com.qualcomm.robotcore.hardware.DcMotorSimple;

@TeleOp(name = "m1Tank (Blocks to Java)", group = "")
public class m1Tank extends LinearOpMode {

  private DcMotor m2;
  private DcMotor m1;

  /**
   * This function is executed when this Op Mode is selected from the Driver Station.
   */
  @Override
  public void runOpMode() {
    m2 = hardwareMap.dcMotor.get("m2");
    m1 = hardwareMap.dcMotor.get("m1");

    // Put initialization blocks here.
    waitForStart();
    if (opModeIsActive()) {
      while (opModeIsActive()) {
        m2.setPower(gamepad1.right_stick_y);
        m1.setDirection(DcMotorSimple.Direction.REVERSE);
        m1.setPower(gamepad1.left_stick_y);
        telemetry.update();
      }
    }
  }
}

