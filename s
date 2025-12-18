MODULE C1_SeamWeld
    ! Position Data
    CONST robtarget rHoopSleave_Stickout_Entry:=[[199.54,-704.87,820.51],[0.0838016,-0.446253,-0.860553,-0.230833],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget rHoopSleave_Seamweld_Entry:=[[-97.36,-6.66,85.59],[0.207232,0.88024,-0.422505,0.0610068],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget rHoopSleave_StickoutSearchStart:=[[210.23,-713.95,734.81],[0.0837369,-0.446287,-0.860572,-0.23072],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget rHoopSleave_StickoutSearchEnd:=[[210.25,-713.95,692.60],[0.0837506,-0.446268,-0.860578,-0.230729],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget rHoopSleave_StickoutTeach:=[[210.21,-713.97,707.76],[0.0837494,-0.446291,-0.860574,-0.230701],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    CONST robtarget rHoopSleave_ProbeLength:=[[-114.17,11.10,0.0],[0.192965,0.871389,-0.44652,0.0637654],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];!Midpoint LHS
    CONST robtarget rHoopSleave_ProbeTop:=[[-117.07,-10.40,-10.0],[0.192921,0.871402,-0.446522,0.0637015],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];!Midpoint RHS)
    CONST robtarget rHoopSleave_ProbeBedPivot:=[[10.58,-22,-10.0],[0.192948,0.871379,-0.446551,0.0637358],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];!Pivot Point RHS
    !CONST robtarget rHoopSleave_ProbeBedPivot:=[[10.58,-30.00,-10.0],[0.192948,0.871379,-0.446551,0.0637358],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];!Pivot Point RHS
    CONST robtarget rHoopSleave_ProbeOffsetLeg:=[[7.96,-177.51,-60.14],[0.192892,0.871418,-0.446493,0.0637727],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];!Angle Leg RHS
    CONST robtarget rHoopSleave_ProbeWeld:=[[-115.07,-0.5,0.0],[0.192921,0.871402,-0.446522,0.0637015],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];!Midpoint RHS)
    
    CONST RobTarget rSeamweld_FirstTack:=[[-225.92,-1.86,0.46],[0.0517553,0.84787,-0.527156,-0.0233336],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST RobTarget rSeamweld_SecondTack:=[[0.24,-0.50,0.01],[0.191535,0.79087,-0.531649,-0.23492],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

    PERS robtarget rTorchTipPos;
    PERS robtarget rSleaveFrontPos;
    PERS robtarget rSleaveBackPos;
    PERS robtarget rSleaveTopPos;
    PERS robtarget rSleaveWeldPos;
    PERS robtarget rBedPivotPos;
    PERS robtarget rOffsetLegPos;
    
    PERS num nSleaveThickness;
    PERS num nSleaveLength;
    PERS num nWeldHeight;
    PERS Bool bWelded;

    !Seamweld Data:
    PERS seamdata sSeam;
    PERS welddata wTackFront;
    PERS welddata wTackback;
    PERS welddata wSeamWeld;
    PERS welddata wSeamWeld_2;
    PERS weavedata wSeamWeave;
    
    ! 2.5mm seamweld Data
    TASK PERS seamdata sSeam_25:=[3,2,[10,2,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],4];
    TASK PERS welddata wTackFront_25:=[5,10,[250,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wTackBack_25:=[4,10,[251,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wSeamWeld_25:=[12,0,[255,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata wSeamWeave_25:=[1,1,3,1,0,1,2,1,50,50,0,0,1,0,0];
    
    ! 3.0mm seamweld Data
    TASK PERS seamdata sSeam_30:=[3,5,[10,2,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],4];
    TASK PERS welddata wTackFront_30:=[15,10,[300,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wTackBack_30:=[4,10,[301,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wSeamWeld_30:=[10,0,[305,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata wSeamWeave_30:=[1,1,3,1,0,1,2,1,50,50,0,0,1,0,0];
    
    ! 5.0mm seamweld Data
    TASK PERS seamdata sSeam_50         :=[3,5,[10,2,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],4];
    TASK PERS welddata wTackFront_50    :=[10,0,[500,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wTackBack_50     :=[10,0,[501,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wSeamWeld_50     :=[5,0,[502,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata wSeamWeave_50   :=[1,1,3,1,0,1,2,1,50,50,0,0,1,0,0];
    
    ! 6.0mm seamweld Data
    TASK PERS seamdata sSeam_60         :=[3,5,[10,2,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],4];
    TASK PERS welddata wTackFront_60    :=[10,0,[600,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]]; ! Was 15mm/s - REACT:DM
    TASK PERS welddata wTackBack_60     :=[10,0,[601,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wStartSeamWeld_60:=[5,0,[605,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]]; ! was 8mm/s - REACT:DM
    TASK PERS welddata wEndSeamWeld_60  :=[5,0,[604,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata wSeamWeave_60   :=[1,1,3,1,0,1,2,1,50,50,0,0,1,0,0];
    
    ! 10.0mm seamweld Data
    TASK PERS seamdata sSeam_100:=[3,5,[10,2,0,0,0,0,0,0,0],0,0,0,0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],0,0,[0,0,0,0,0,0,0,0,0],4];
    TASK PERS welddata wTackFront_100:=[5,5,[1000,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wTackBack_100:=[5,10,[999,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wSeamWeld_100:=[6.4,5,[995,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS welddata wBackWeld_100:=[7,5,[994,2,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]];
    TASK PERS weavedata wSeamWeave_100:=[1,1,3,1,0,1,2,1,50,50,0,0,1,0,0];! [3,0,-3,3,0,1,2,1,50,50,0,0,5,0,0];
    
    !Offset
    VAR num offset := 0;

    PROC pSearchStickout()
        !   This Program Searches for the Tip of the Torch        
        VAR num nAnswer;

        SetGO goR2_Cycle_sts,sts_ChekingStickout;
        ! Turn on Touch Sense & Search For the stickout post
        SETDO doFr2TouchSense,0;
        WaitTime 2.0;
        SETDO doFr2TouchSense,1;
        WaitTime 2.0;

        MoveL rHoopSleave_StickoutSearchStart,vHighSpeed,z5,WF25i\WObj:=wobj0;
        SearchL\Stop,diFr2TouchSense,rTorchTipPos,rHoopSleave_StickoutSearchEnd,v10,WF25i\WObj:=wobj0;
        ! Error Handling Failed Search
    ERROR
        IF ERRNO=ERR_WHLSEARCH THEN
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"Search Failed to Find Tip!","","","Abort","Retry","Continue";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_Search_Failed\Question);
            ENDIF
            IF nAnswer=nAlarm_Retry THEN
                ! If Alarm Responce is to Retry, Go back to Search start position
                StorePath;
                MoveL rHoopSleave_StickoutSearchStart,vHighSpeed,z10,WF25i\WObj:=wobj0;
                RestoPath;
                ClearPath;
                StartMove;
                RETRY;
            ELSEIF nAnswer=nAlarm_Continue THEN
                ! IF alarm Responce is to Continue, Reset Touch Sense
                SETDO doFr2TouchSense,0;
                RETURN ;
            ELSE
                ! Abort
                SETDO doFr2TouchSense,0;
                MoveL rHoopSleave_Stickout_Entry,vHighSpeed,z10,WF25i\WObj:=wobj0;
                ExitCycle;
            ENDIF
        ENDIF
        WaitTime 2.0;
    ENDPROC

    PROC pSetStickout()
        VAR num nAnswer;
        VAR num nStickoutTries;
        ! Turn on Touch Sense
        SETDO doFr2TouchSense,0;
        SETDO doFr2TouchSense,1;
        WaitDO doFr2TouchSense,1;
        WaitTime 2.0;

        MoveL OFFS(rHoopSleave_StickoutTeach,0,0,25),vHighSpeed,z10,WF25i\WObj:=wobj0;
        ! Retract Welding wire before setting stickout
        SetGO goR2_Cycle_sts,sts_RetractWire;
        PulseDO\PLength:=4.0,doFr2FeedRetract;
        WaitTime 1.0;
        SETDO doFr2FeedRetract,0;
        WaitDO doFr2FeedRetract,0;
        Waittime 1.0;


        !Go to the stickout teach height
        SetGO goR2_Cycle_sts,sts_Teachheight;
        MoveL rHoopSleave_StickoutTeach,vSlowSpeed,Fine,WF25i\WObj:=wobj0;
        
        
        
        FeedWire:
        nStickoutTries:=0;
        ! Extend the wire to the correct Length
        SetGO goR2_Cycle_sts,sts_FeedWire;
        PulseDO\PLength:=1,doFr2FeedForward;
        IF diFr2TouchSense=1 THEN
            ! If the wire touches the teach tool, the Wirestickout is complete, and we return to main
        ELSEIF nStickoutTries>10 THEN
            !If it take more than five attempts, Flag an alarm.
            SETDO doFr2FeedForward,0;
            SETDO doFr2FeedRetract,0;
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"Failed to Extend Tip!","","","Abort","Retry","Continue";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_ExtendWire_Failed\Question);
            ENDIF
            IF nAnswer=nAlarm_Retry THEN
                !Retry
                GOTO FeedWire;
            ELSEIF nAnswer=nAlarm_Continue THEN
                !Continue
            ELSE
                !Abort
                MoveL rHoopSleave_Stickout_Entry,vHighSpeed,z10,WF25i\WObj:=wobj0;
                ExitCycle;
            ENDIF
        ELSE
            !Increment number of attempts at sticking out wire
            nStickoutTries:=nStickoutTries+1;
            GOTO FeedWire;
        ENDIF
        ! Turn Off Touch Sense
        SETDO doFr2FeedForward,0;
        SETDO doFr2FeedRetract,0;
        SETDO doFr2TouchSense,0;
        MoveJ OFFS(rHoopSleave_StickoutTeach,0,0,50),vHighSpeed,Fine,WF25i\WObj:=wobj0;
        WaitTime 2.0;
    ENDPROC

    PROC pProbeThickness()
        VAR num nAnswer;

        VAR num x1;
        VAR num y1;
        VAR num x2;
        VAR num y2;
        VAR num x3;
        VAR num y3;
        VAR num A;
        VAR num B;
        VAR num C;
        VAR num nThickness; !Distance from Line
        VAR string sThickness;
        VAR robtarget ProbeBedPivot;
        ! Turn on Touch Sense
        SETDO doFr2TouchSense,0;
        SETDO doFr2TouchSense,1;
        WaitDO doFr2TouchSense,1;
        WaitTime 2.0;

        !Search For Coupling Thickness
        ProbeThickness:
        !Search Offset Leg
        SetGO goR2_Cycle_sts,sts_Search_OffsetLeg;
        MoveJ Offs(rHoopSleave_ProbeOffsetLeg,0,0,200),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        MoveL Offs(rHoopSleave_ProbeOffsetLeg,0,0,40),vHighSpeed,fine,WF25i\WObj:=wManualClamp;
        SearchL\Stop,diFr2TouchSense,rOffsetLegPos,rHoopSleave_ProbeOffsetLeg,v5,WF25i\WObj:=wManualClamp;
        MoveL Offs(rHoopSleave_ProbeOffsetLeg,0,0,40),vSlowSpeed,fine,WF25i\WObj:=wManualClamp;
        MoveJ Offs(rHoopSleave_ProbeOffsetLeg,0,0,200),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        
        !Search BedPivot
        SetGO goR2_Cycle_sts,sts_Search_BedPivot;
        !MoveJ Offs(rHoopSleave_ProbeBedPivot,0,0,200),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        MoveJ Offs(rHoopSleave_ProbeBedPivot,0,0,200),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        MoveL Offs(rHoopSleave_ProbeBedPivot,0,0,10),vHighSpeed,fine,WF25i\WObj:=wManualClamp;
        !ProbeBedPivot:=Offs(rHoopSleave_ProbeBedPivot,0,0,0);
        SearchL\Stop,diFr2TouchSense,rBedPivotPos,rHoopSleave_ProbeBedPivot,v5,WF25i\WObj:=wManualClamp;
        MoveL Offs(rHoopSleave_ProbeBedPivot,0,0,10),vSlowSpeed,fine,WF25i\WObj:=wManualClamp;
        MoveJ Offs(rHoopSleave_ProbeBedPivot,0,0,200),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        
        !Search Sleave Top
        SetGO goR2_Cycle_sts,sts_Search_Sleave;
        MoveJ Offs(RHoopSleave_ProbeTop,0,0,200),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        MoveL Offs(RHoopSleave_ProbeTop,0,0,25),vHighSpeed,fine,WF25i\WObj:=wManualClamp;
        SearchL\Stop,diFr2TouchSense,rSleaveTopPos,RHoopSleave_ProbeTop,v5,WF25i\WObj:=wManualClamp;
        MoveL Offs(RHoopSleave_ProbeTop,0,0,25),vSlowspeed,fine,WF25i\WObj:=wManualClamp;
        MoveJ Offs(RHoopSleave_ProbeTop,0,0,200),vHighSpeed,z10,WF25i\WObj:=wManualClamp;

        SetGO goR2_Cycle_sts,sts_Calculate_Thickness;
        !This Function is used to Adjust for the slop of the clamp when determining the thickness of the 
        !Material in the Manual Clamp seam welder.
        !Here we calculate the Standard formula for the line between P1 & P2 where:
        !P1 = A point near the pivot of the RHS lower clamp body
        !P2 = A point on the offset leg of the RHS lower clamp body

        !y= Robot Z coordinate
        !x= Robot y coordiante
        !Substitute P1 & P2 into x & y variables
        x1:=rOffsetLegPos.trans.y;
        y1:=rOffsetLegPos.trans.z;
        x2:=rBedPivotPos.trans.y;
        y2:=rBedPivotPos.trans.z;

        !Standard Line formual: (Ax+By+C=0)
        !A = y2 - y1
        A:=y2-y1;
        !B = x1 - x2
        B:=x1-x2;
        !C = y1 × (x2 - x1) - (y2 - y1) × x1
        C:=y1*(x2-x1)-(y2-y1)*x1;
        
        ! We now use the 'Point - Distance from line' formula. Using P3 where
        !P3 = A point in the center of the length of the coupling
        !Substitute P3 into x & y variables
        x3:=rSleaveTopPos.Trans.y;
        y3:=rSleaveTopPos.Trans.z;

        !Distance Line Formula: (d=ABS(Ax + By + C)/SQR(A^2 + B^2)
        !Remove Absloute so we can determine if we are above or below the line
        nThickness:=-((A*x3+B*y3+C)/SQRT(POW(A,2)+POW(B,2)));
        nSleaveThickness := Round(nThickness\Dec:=1);
        sThickness := ValToStr(nSleaveThickness);
        
        SetGO goR2_SleaveThickness,Round(nThickness\Dec:=1)*10;
        
        !Confirm Thickness of Part
        IF nThickness < 0 THEN
            ! If the thickness is negative, nothing is loaded.
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"No Hoop or Sleave Detected!","","","Abort","Retry","Continue";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_TopProbe_Failed\Question);
            ENDIF
            IF nAnswer=nAlarm_Retry THEN
                !Retry
                GOTO ProbeThickness;
            ELSEIF nAnswer=nAlarm_Continue THEN
                !Continue
            ELSE
                !Abort
                MoveL rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
                ExitCycle;
            ENDIF
        ELSE
            IF pPendantAlarmControl THEN
                ! Confirm thickness
                TPErase;
                TPReadFK nAnswer,StrFormat("Is the Material Thickness: {1}mm?" \Arg1:=sThickness),"","","Abort","Retry","Continue";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_Confirm_Thickness\Question);
            ENDIF
            IF nAnswer=nAlarm_Retry THEN
                !Retry
                GOTO ProbeThickness;
            ELSEIF nAnswer=nAlarm_Continue THEN
                !Continue
                !If the PLC confirms the Correct Material is loaded, we use its value as the Weld parameter
                nSleaveThickness := giR2_SleaveThickness*0.1;
            ELSE
                !Abort
                MoveL rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
                ExitCycle;
            ENDIF
        ENDIF
        
        SETDO doFr2TouchSense,0;
        WaitDO doFr2TouchSense,0;
        Waittime 2.0;
    ENDPROC
    
    PROC pProbeLength()
        VAR num nAnswer;
        VAR num nLength;
        VAR String sLength;
        CONST num WireSize:=1.2;
        
        ! Turn on Touch Sense
        SETDO doFr2TouchSense,0;
        SETDO doFr2TouchSense,1;
        WaitDO doFr2TouchSense,1;
        waitTime 2.0;
        MoveJ Offs(rHoopSleave_ProbeLength,0,-20,200),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        
        
        ProbeFront:
        !Search For Front of Coupling
        SetGO goR2_Cycle_sts,sts_Search_Front;
        MoveL Offs(rHoopSleave_ProbeLength,-120,-10,25),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        MoveL Offs(rHoopSleave_ProbeLength,-120,-10,0),vSlowSpeed,fine,WF25i\WObj:=wManualClamp;
        SearchL\Stop,diFr2TouchSense,rSleaveFrontPos,rHoopSleave_ProbeLength,v5,WF25i\WObj:=wManualClamp;
        MoveL Offs(rSleaveFrontPos,-10,0,0),v5,fine,WF25i\WObj:=wManualClamp;
        MoveL Offs(rSleaveFrontPos,-10,0,25),vSlowSpeed,fine,WF25i\WObj:=wManualClamp;
        
        ProbeBack:
        !Search for Back of Coupling
        SetGO goR2_Cycle_sts,sts_Search_Back;
        MoveL Offs(rHoopSleave_ProbeLength,120,-10,25),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        MoveL Offs(rHoopSleave_ProbeLength,120,-10,0),vSlowSpeed,fine,WF25i\WObj:=wManualClamp;
        SearchL\Stop,diFr2TouchSense,rSleaveBackPos,rHoopSleave_ProbeLength,v5,WF25i\WObj:=wManualClamp;
        MoveL Offs(rSleaveBackPos,10,0,0),v5,fine,WF25i\WObj:=wManualClamp;
        MoveL Offs(rSleaveBackPos,10,0,25),vSlowSpeed,fine,WF25i\WObj:=wManualClamp;
        MoveJ Offs(rHoopSleave_ProbeLength,0,-20,200),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        
         SetGO goR2_Cycle_sts,sts_Calculate_Length;
        !Calculate Part Dimensions
        !Length = back x coordinate - Front x Coordinate - wire thickness
        nLength := (rSleaveBackPos.Trans.x - rSleaveFrontPos.Trans.x)-(WireSize);
        nSleaveLength := Round(nLength\Dec:=1);
        SetGO goR2_SleaveLength,nSleaveLength*10;
        sLength := ValToStr(nSleaveLength);
        
        IF nLength > 0 AND pPendantConfirmationControl THEN
            IF pPendantAlarmControl THEN
                ! Confirm thickness
                TPErase;
                TPReadFK nAnswer,StrFormat("Is the Material Length: {1}mm?" \Arg1:=sLength),"","","Abort","Retry","Continue";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_Confirm_Length\Question);
            ENDIF
            IF nAnswer=nAlarm_Retry THEN
                !Retry
                GOTO ProbeFront;
            ELSEIF nAnswer=nAlarm_Continue THEN
                !Continue
                RETURN;
            ELSE
                !Abort
                MoveL rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
                ExitCycle;
            ENDIF
        ENDIF
        !Return Part Dimensions        
    ERROR
        IF ERRNO=ERR_WHLSEARCH THEN
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"Search Failed to Coupling!","","","Abort","Retry","Continue";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_Search_Failed\Question);
            ENDIF
            IF nAnswer=nAlarm_Retry THEN
                ! If Alarm Responce is to Retry, Go back to Search start position
                StorePath;
                !MoveL rHoopSleave_StickoutSearchStart,vHighSpeed,z10,WF25i\WObj:=wobj0;
                RestoPath;
                ClearPath;
                StartMove;
                RETRY;
            ELSEIF nAnswer=nAlarm_Continue THEN
                ! IF alarm Responce is to Continue, Reset Touch Sense
                RETURN;
            ELSE
                ! Abort
                MoveL rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
                ExitCycle;
            ENDIF
        ENDIF
        
    ENDPROC
    
    PROC pProbeWeld()
        VAR num nAnswer;
        ! This Process Searches for an Already Complete seam weld from the back side
        
        
        ! Turn on Touch Sense
        SETDO doFr2TouchSense,0;
        SETDO doFr2TouchSense,1;
        WaitDO doFr2TouchSense,1;
        WaitTime 2.0;

        !Search For Coupling Thickness
        ProbeWeld:
        
        !Search Sleave Top
        SetGO goR2_Cycle_sts,sts_Search_Sleave;
        MoveJ Offs(rHoopSleave_ProbeWeld,0,-20,200),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        MoveL Offs(rHoopSleave_ProbeWeld,0,0,25),vHighSpeed,fine,WF25i\WObj:=wManualClamp;
        SearchL\Stop,diFr2TouchSense,rSleaveWeldPos,rHoopSleave_ProbeWeld,v5,WF25i\WObj:=wManualClamp;
        MoveL Offs(rHoopSleave_ProbeWeld,0,0,25),vSlowspeed,fine,WF25i\WObj:=wManualClamp;
        MoveJ Offs(rHoopSleave_ProbeWeld,0,-20,200),vHighSpeed,z10,WF25i\WObj:=wManualClamp;

        nWeldHeight := rSleaveWeldPos.Trans.z+3; 

        IF nWeldHeight > nSleaveThickness THEN
            ! If the thickness is Greater tahn 0, and less than the thickness, a Previously welded part is loaded.
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"Wrong Weld Found!","","","Abort","Retry","Continue";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_Search_Failed\Question);
            ENDIF
            IF nAnswer=nAlarm_Retry THEN
                !Retry
                GOTO ProbeWeld;
            ELSEIF nAnswer=nAlarm_Continue THEN
                bWelded := TRUE;
            ELSE
                !Abort
                MoveL rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
                ExitCycle;
            ENDIF
        ENDIF
        
        SETDO doFr2TouchSense,0;
        WaitDO doFr2TouchSense,0;
        Waittime 2.0;
        
        ERROR
        IF ERRNO=ERR_WHLSEARCH THEN
            !Reset Touch Sense
            SETDO doFr2TouchSense,0;
            bWelded := TRUE;
            nWeldHeight := 0;
            RETURN;
        ENDIF
    ENDPROC
    
    
    PROC pRing_SeamWeld()
        VAR num nAnswer;
        
        VAR RobTarget rSeamweld_Start:=[[-227.33,-0.25,2.06],[0.183383,0.703993,-0.68492,0.0406185],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR RobTarget rSeamweld_Mid:=[[-227.33,-0.25,2.06],[0.183383,0.703993,-0.68492,0.0406185],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR RobTarget rSeamweld_End:=[[-1.49,0.07,1.54],[0.183389,0.703971,-0.684938,0.0406695],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        
        SetGO goR2_Cycle_sts, sts_SeamWelding;
        
        SetDO doFr2WeldingSim,0;
        MoveJ rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        SetDO doFr2Mode0,0;
        ! Turn Job Mode back On
        SetDO doFr2Mode1,1;
        
        rSeamweld_Start.Trans.x := rSleaveFrontPos.Trans.x+2;
        rSeamweld_Start.Trans.z := rSleaveTopPos.Trans.z;
        
        rSeamweld_Mid.Trans.x := rSleaveFrontPos.Trans.x/2;
        rSeamweld_Mid.Trans.z := rSleaveTopPos.Trans.z;
        
        rSeamweld_End.Trans.x := rSleaveBackPos.Trans.x;
        rSeamweld_End.Trans.z := rSleaveTopPos.Trans.z;
        
        !Set Weld Parameters
        IF nSleaveThickness <= 2.9 THEN
            sSeam := sSeam_25;
            wSeamWeld  := wSeamWeld_25;
        ELSEIF nSleaveThickness > 2.9 AND nSleaveThickness <= 3.9 THEN
            sSeam := sSeam_30;
           wSeamWeld  := wSeamWeld_30;
        !ELSEIF nSleaveThickness > 3.9 AND nSleaveThickness <= 4.9 THEN  
        !ELSEIF nSleaveThickness > 4.9 AND nSleaveThickness <= 5.9 THEN  
        ELSEIF nSleaveThickness > 5.9 AND nSleaveThickness <= 6.9 THEN 
                sSeam := sSeam_60;
                wSeamWeld   := wStartSeamWeld_60;
                wSeamWeld_2 := wEndSeamWeld_60;
                wSeamWeave  := wSeamWeave_60;
        !ELSEIF nSleaveThickness > 6.9 AND nSleaveThickness <= 7.9 THEN
        !ELSEIF nSleaveThickness > 7.9 AND nSleaveThickness <= 8.9 THEN
        !ELSEIF nSleaveThickness > 8.9  AND nSleaveThickness <= 10.9 THEN
        !    IF nWeldHeight > 0 THEN
        !        sSeam := sSeam_100;
        !        wSeamWeld   := wBackWeld_100;
        !        wSeamWeld_2 := wBackWeld_100;
        !        wSeamWeave  := wSeamWeave_100;
        !    ELSE
        !        sSeam := sSeam_100;
        !       wSeamWeld   := wSeamWeld_100;
        !        wSeamWeld_2 := wSeamWeld_100;
        !        wSeamWeave  := wSeamWeave_100;
        !    ENDIF
        ELSE
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"No Weld Data for this Job!","","","Abort","","";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_NoWeldData\Question);
            ENDIF
            IF nAnswer>0 THEN
                ExitCycle;
            ENDIF
        ENDIF
        
        !Move to Seamweld start
        MoveL offs(rSeamweld_start,0,0,50),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        !Seam weld
        ArcLStart rSeamweld_start,v100,sSeam,wSeamWeld\Weave:=wSeamWeave,fine,WF25i\WObj:=wManualClamp;
        ArcL rSeamweld_Mid,v100,sSeam,wSeamWeld\Weave:=wSeamWeave,fine,WF25i\WObj:=wManualClamp;
        ArcLEnd rSeamweld_End,v100,sSeam,wSeamWeld\Weave:=wSeamWeave,fine,WF25i\WObj:=wManualClamp;
        MoveL offs(rSeamweld_End,0,0,50),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        
        ! Turn Job Mode off
        SetDO doFr2Mode0,0;
        SetDO doFr2Mode1,0;
    ENDPROC
    
    PROC pRing_FrontTack ()
         VAR num nAnswer;
        
        VAR RobTarget rSeamweld_FirstTackStart:=[[-225.92,0.00,0.46],[0.0517553,0.84787,-0.527156,-0.0233336],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR RobTarget rSeamweld_FirstTackEnd:=[[-225.92,-4.00,0.46],[0.0517553,0.84787,-0.527156,-0.0233336],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        
        SetGO goR2_Cycle_sts, sts_TackingFront;
        
        SetDO doFr2WeldingSim,0;
        MoveJ rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        ! Turn Job Mode back On
        SetDO doFr2Mode0,0;
        SetDO doFr2Mode1,1;
        
        !Define Weld Start and End
        rSeamweld_FirstTackStart.Trans.x :=rSleaveFrontPos.Trans.x+2;
        rSeamweld_FirstTackStart.Trans.z :=rSleaveTopPos.Trans.z/2;
        rSeamweld_FirstTackEnd.Trans.x :=rSleaveFrontPos.Trans.x+2;
        rSeamweld_FirstTackEnd.Trans.z :=rSleaveTopPos.Trans.z/2;
        
        !Set Weld Parameters
        IF nSleaveThickness <= 2.9 THEN
           sSeam := sSeam_25;
            wTackFront  := wTackFront_25;
        ELSEIF nSleaveThickness > 2.9 AND nSleaveThickness <= 3.9 THEN
            sSeam := sSeam_30;
            wTackFront  := wTackFront_30;
        !ELSEIF nSleaveThickness > 3.9 AND nSleaveThickness <= 4.9 THEN  
        !ELSEIF nSleaveThickness > 4.9 AND nSleaveThickness <= 5.9 THEN  
        ELSEIF nSleaveThickness > 5.9 AND nSleaveThickness <= 6.9 THEN
            sSeam := sSeam_60;
            wTackFront  := wTackFront_60;
        !ELSEIF nSleaveThickness > 6.9 AND nSleaveThickness <= 7.9 THEN
        !ELSEIF nSleaveThickness > 7.9 AND nSleaveThickness <= 8.9 THEN
        !ELSEIF nSleaveThickness > 8.9  AND nSleaveThickness <= 10.9 THEN
        !    sSeam := sSeam_100;
        !    wTackFront  := wTackFront_100;
        !ELSE
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"No Weld Data for this Job!","","","Abort","","";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_NoWeldData\Question);
            ENDIF
            IF nAnswer>0 THEN
                ExitCycle;
            ENDIF
        ENDIF
        
        ! Move to First Tack
        MoveL offs(rSeamweld_FirstTack,0,0,50),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        MoveL rSeamweld_FirstTack,v100,z5,WF25i\WObj:=wManualClamp;
        ! First Tack
        ArcLStart rSeamweld_FirstTackStart,v100,sSeam,wTackFront,fine,WF25i\WObj:=wManualClamp;
        ArcLEnd rSeamweld_FirstTackEnd,v100,sSeam,wTackFront,fine,WF25i\WObj:=wManualClamp;
        MoveL offs(rSeamweld_FirstTack,0,0,50),vHighSpeed,z100,WF25i\WObj:=wManualClamp;
        
        ! Turn Job Mode off
        SetDO doFr2Mode0,0;
        SetDO doFr2Mode1,0;
    ENDPROC
    
    PROC pHoopSleave_BackTack()
        VAR num nAnswer;
        
        VAR RobTarget rSeamweld_SecondTackStart:=[[0.0,-3,0.01],[0.191535,0.79087,-0.531649,-0.23492],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR RobTarget rSeamweld_SecondTackEnd:=[[0.0,-6,0.01],[0.191535,0.79087,-0.531649,-0.23492],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        
        SetGO goR2_Cycle_sts, sts_TackingBack;
        
        SetDO doFr2WeldingSim,0;
        !MoveJ rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        SetDO doFr2Mode0,0;
        ! Turn Job Mode back On
        SetDO doFr2Mode1,1;
        
        !Define Weld start and end
        rSeamweld_SecondTackStart.Trans.x :=rSleaveBackPos.trans.x;
        rSeamweld_SecondTackStart.Trans.z :=rSleaveTopPos.trans.z+2;
        rSeamweld_SecondTackEnd.Trans.x :=rSleaveBackPos.trans.x;
        rSeamweld_SecondTackEnd.Trans.z :=rSleaveTopPos.trans.z+2;
        
        !Set Weld Parameters
       IF nSleaveThickness <= 2.9 THEN
            sSeam := sSeam_25;
            wTackback   := wTackback_25;
        ELSEIF nSleaveThickness > 2.9 AND nSleaveThickness <= 3.9 THEN
            !SetGO goFr2JobProgNum,305;
            sSeam := sSeam_30;
            wTackback   := wTackback_30;
        !ELSEIF nSleaveThickness > 3.9 AND nSleaveThickness <= 4.9 THEN  
        ELSEIF nSleaveThickness > 4.9 AND nSleaveThickness <= 5.9 THEN
            sSeam := sSeam_50;
            wTackback   := wTackback_50;
        ELSEIF nSleaveThickness > 5.9 AND nSleaveThickness <= 6.9 THEN
            sSeam := sSeam_60;
            wTackback   := wTackback_60;
        !ELSEIF nSleaveThickness > 6.9 AND nSleaveThickness <= 8.9 THEN
        !ELSEIF nSleaveThickness > 8.9  AND nSleaveThickness <= 10.9 THEN
         !   sSeam  := sSeam_100;
         !   wTackback   := wTackback_100;
        ELSE
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"No Weld Data for this Job!","","","Abort","","";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_NoWeldData\Question);
            ENDIF
            IF nAnswer>0 THEN
                MoveL rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
                ExitCycle;
            ENDIF
        ENDIF

        ! Move to Second Tack
        MoveJ offs(rSeamweld_SecondTack,0,0,50),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        MoveL rSeamweld_SecondTack,v100,z5,WF25i\WObj:=wManualClamp;
        ! Second Tack
        ArcLStart rSeamweld_SecondTackStart,v100,sSeam,wTackBack,fine,WF25i\WObj:=wManualClamp;
        ArcLEnd rSeamweld_SecondTackEnd,v100,sSeam,wTackBack,fine,WF25i\WObj:=wManualClamp;
        MoveL offs(rSeamweld_SecondTack,0,0,50),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        
        ! Turn Job Mode off
        SetDO doFr2Mode0,0;
        SetDO doFr2Mode1,0;
    ENDPROC

PROC pRing_BackTack()
        VAR num nAnswer;
        
        VAR RobTarget rSeamweld_SecondTackStart:=[[0.0,-1,0.01],[0.191535,0.79087,-0.531649,-0.23492],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR RobTarget rSeamweld_SecondTackEnd:=[[0.0,-4,0.01],[0.191535,0.79087,-0.531649,-0.23492],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        
        SetGO goR2_Cycle_sts, sts_TackingBack;
        
        SetDO doFr2WeldingSim,0;
        !MoveJ rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        SetDO doFr2Mode0,0;
        ! Turn Job Mode back On
        SetDO doFr2Mode1,1;
        
        !Define Weld start and end
        rSeamweld_SecondTackStart.Trans.x :=rSleaveBackPos.trans.x+1;
        rSeamweld_SecondTackStart.Trans.z :=rSleaveTopPos.trans.z/2;
        rSeamweld_SecondTackEnd.Trans.x :=rSleaveBackPos.trans.x+1;
        rSeamweld_SecondTackEnd.Trans.z :=rSleaveTopPos.trans.z/2;
        
        !Set Weld Parameters
        !IF nSleaveThickness <= 2.9 THEN
        !    sSeam := sSeam_25;
        !    wTackback   := wTackback_25;
        !ELSEIF nSleaveThickness > 2.9 AND nSleaveThickness <= 3.9 THEN
        !    sSeam := sSeam_30;
        !    wTackback   := wTackback_30;
        !ELSEIF nSleaveThickness > 3.9 AND nSleaveThickness <= 4.9 THEN  
        !ELSEIF nSleaveThickness > 4.9 AND nSleaveThickness <= 5.9 THEN  
        IF nSleaveThickness > 5.9 AND nSleaveThickness <= 6.9 THEN  
            sSeam := sSeam_60;
            wTackback   := wTackback_60;
        !ELSEIF nSleaveThickness > 6.9 AND nSleaveThickness <= 8.9 THEN
        ELSEIF nSleaveThickness > 8.9  AND nSleaveThickness <= 10.9 THEN
            sSeam := sSeam_100;
            wTackback   := wTackback_100;
        ELSE
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"No Weld Data for this Job!","","","Abort","","";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_NoWeldData\Question);
            ENDIF
            IF nAnswer>0 THEN
                MoveL rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
                ExitCycle;
            ENDIF
        ENDIF

        ! Move to Second Tack
        MoveJ offs(rSeamweld_SecondTack,0,0,50),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        MoveL rSeamweld_SecondTack,v100,z5,WF25i\WObj:=wManualClamp;
        ! Second Tack
        ArcLStart rSeamweld_SecondTackStart,v100,sSeam,wTackBack,fine,WF25i\WObj:=wManualClamp;
        ArcLEnd rSeamweld_SecondTackEnd,v100,sSeam,wTackBack,fine,WF25i\WObj:=wManualClamp;
        MoveL offs(rSeamweld_SecondTack,0,0,50),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        
        ! Turn Job Mode off
        SetDO doFr2Mode0,0;
        SetDO doFr2Mode1,0;
    ENDPROC
    
PROC pHoopSleave_SeamWeld()
        VAR num nAnswer;
        VAR RobTarget rSeamweld_FirstTackStart:=[[-225.92,0.00,0.46],[0.183383,0.703993,-0.68492,0.0406185],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR RobTarget rSeamweld_FirstTackEnd:=[[-225.92,-2.00,0.46],[0.183383,0.703993,-0.68492,0.0406185],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
        VAR RobTarget rSeamweld_Start:=[[-227.33,-0.89,2.06],[0.183383,0.703993,-0.68492,0.0406185],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]; ! y Was -0.25
        VAR RobTarget rSeamweld_End:=[[-1.49,-1.93,1.54],[0.183383,0.703993,-0.68492,0.0406185],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]]; !y was 0.07
        
        SetDO doFr2WeldingSim,0;
        !MoveJ rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        SetDO doFr2Mode0,0;
        ! Turn Job Mode back On
        SetDO doFr2Mode1,1;
        
        !Define Weld Start and End
        rSeamweld_FirstTackStart.Trans.x :=rSleaveFrontPos.Trans.x+2;
        rSeamweld_FirstTackStart.Trans.z :=rSleaveTopPos.Trans.z+2; !Fudge height by 2mm
        rSeamweld_FirstTackEnd.Trans.x :=rSleaveFrontPos.Trans.x+1;
        rSeamweld_FirstTackEnd.Trans.z :=rSleaveTopPos.Trans.z+2; !Fudge height by 2mm
        rSeamweld_Start.Trans.x := rSleaveFrontPos.Trans.x+2;
        rSeamweld_Start.Trans.z := rSleaveTopPos.Trans.z+2;
        rSeamweld_End.Trans.x := rSleaveBackPos.Trans.x+1;
        rSeamweld_End.Trans.z := rSleaveTopPos.Trans.z+2;
        
        !Set Weld Parameters
        IF nSleaveThickness <= 2.9 THEN
            sSeam := sSeam_25;
            wTackFront  := wTackFront_25;
            wSeamWeld  := wSeamWeld_25;
            wSeamWeave := wSeamWeave_25;
            
            rSeamweld_Start.Trans.y := -2.15;
            rSeamweld_End.Trans.y := -2.9;
        ELSEIF nSleaveThickness > 2.9 AND nSleaveThickness <= 3.9 THEN
            !SetGO goFr2JobProgNum,305;
            sSeam := sSeam_30;
            wTackFront  := wTackFront_30;
            wSeamWeld  := wSeamWeld_30;
            wSeamWeave := wSeamWeave_30;
            
            rSeamweld_Start.Trans.y := -2.0;
            rSeamweld_End.Trans.y := -2.7; !-1.55
        !ELSEIF nSleaveThickness > 3.9 AND nSleaveThickness <= 4.9 THEN  
        ELSEIF nSleaveThickness > 4.9 AND nSleaveThickness <= 5.9 THEN 
            sSeam := sSeam_50;
            wTackFront := wTackFront_50;
            wSeamWeld  := wSeamWeld_50;
            wSeamWeave := wSeamWeave_50;
            
            rSeamweld_Start.Trans.y := -1.9; !0.89
            rSeamweld_End.Trans.y := -2.5;
        ELSEIF nSleaveThickness > 5.9 AND nSleaveThickness <= 6.9 THEN  
            sSeam := sSeam_60;
            wTackFront := wTackFront_60;
            wSeamWeld  := wStartSeamWeld_60;
            wSeamWeave := wSeamWeave_60;
            
            rSeamweld_Start.Trans.y := -1.9; !0.89
            rSeamweld_End.Trans.y := -2.5;
        !ELSEIF nSleaveThickness > 6.9 AND nSleaveThickness <= 8.9 THEN
        !ELSEIF nSleaveThickness > 8.9  AND nSleaveThickness <= 10.9 THEN
        !    sSeam := sSeam_100;
        !    wTackFront  := wTackFront_100;
        !    wSeamWeld  := wSeamWeld_100;
        !    wSeamWeave := wSeamWeave_100;
        !   
        !    rSeamweld_Start.Trans.y := -1.5;
        !    rSeamweld_End.Trans.y := -1.5;
        ELSE
            IF pPendantAlarmControl THEN
                ! If Robot Pendant enabled show popup on Pendant
                TPErase;
                TPReadFK nAnswer,"No Weld Data for this Job!","","","Abort","","";
            ELSE
                ! Otherwise Look for Feedback from PLC
                nAnswer:=fAlarmControl(Alarm_NoWeldData\Question);
            ENDIF
            IF nAnswer>0 THEN
                MoveL rHoopSleave_Seamweld_Entry,vHighSpeed,z10,WF25i\WObj:=wManualClamp;
                ExitCycle;
            ENDIF
        ENDIF
        
        !Move to Seamweld start
        MoveL offs(rSeamweld_start,0,0,50),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        !Seam weld
        ArcLStart rSeamweld_FirstTackStart,v100,sSeam,wTackFront,fine,WF25i\WObj:=wManualClamp;
        ArcL rSeamweld_FirstTackEnd,v100,sSeam,wTackFront,z5,WF25i\WObj:=wManualClamp;
        ArcL rSeamweld_start,v100,sSeam,wSeamWeld\Weave:=wSeamWeave,z5,WF25i\WObj:=wManualClamp; 
        ArcLEnd rSeamweld_End,v100,sSeam,wSeamWeld\Weave:=wSeamWeave,fine,WF25i\WObj:=wManualClamp;
        WaitTime 4.0;
        MoveL offs(rSeamweld_End,0,0,50),vHighSpeed,z10,WF25i\WObj:=wManualClamp;
        
        ! Turn Job Mode off
        SetDO doFr2Mode0,0;
        SetDO doFr2Mode1,0;
    ENDPROC    
ENDMODULE

