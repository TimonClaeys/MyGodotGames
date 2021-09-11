using Godot;
using System;

public class Player : KinematicBody2D
{
    
    Vector2 velocity = Vector2.Zero, direction = Vector2.Zero, inputVector = Vector2.Zero;
    float maxSpeed = 100f, acceleration = 5f, speed, friction = 2f;

    // Called when the node enters the scene tree for the first time.
    public override void _Ready()
    {

    }

//  // Called every frame. 'delta' is the elapsed time since the previous frame.
    public override void _Process(float delta)
    {

    }
    public override void _PhysicsProcess(float delta)
    {

        inputVector.x = Input.GetActionStrength("ui_right") - Input.GetActionStrength("ui_left");
        inputVector.y = Input.GetActionStrength("ui_down") - Input.GetActionStrength("ui_up");
        GD.Print($"inputVector: {inputVector}");

        if (inputVector != Vector2.Zero)
        {
            direction = inputVector.Normalized();

            speed = Mathf.MoveToward(speed, maxSpeed, acceleration);

            GD.Print("hello");
        }
        else
        {
            speed = Mathf.MoveToward(speed, 0, friction);
        }

        GD.Print($"speed: {speed}");

        velocity = speed * direction;
        
        MoveAndSlide(velocity);
    }
}
