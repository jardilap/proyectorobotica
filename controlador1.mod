MODULE Module1
        CONST robtarget Target_30:=[[-299.326,-0.582,300.001],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_20:=[[0.674,-0.582,100.001],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_10:=[[0.674,-0.582,0.001],[0,0,1,0],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_60:=[[-512.95,588.826,797.258],[0.707106781,0,0.707106781,0],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_50:=[[-187.95,588.826,797.258],[0.707106781,0,0.707106781,0],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_40:=[[-87.95,588.826,797.258],[0.707106781,0,0.707106781,0],[0,-2,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Target_70:=[[-7.923,-38.701,-10.664],[0,0,1,0],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget Home:=[[-500.958364669,225.1,899],[0.5,0,0.866025404,0],[2,2,-1,6],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!***********************************************************
    !
    ! Módulo:  Module1
    !
    ! Descripción:
    !   <Introduzca la descripción aquí>
    !
    ! Autor: KTCHIA
    !
    ! Versión: 1.0
    !
    !***********************************************************
    
    
    !***********************************************************
    !
    ! Procedimiento Main
    !
    !   Este es el punto de entrada de su programa
    !
    !***********************************************************
    PROC main()
        !Añada aquí su código
        SetDO Q_finish,0;
        Path_recogida;
        Path_descarga;
        SetDO Q_finish,1;
        WaitDI E_begin,1;
        IF E_begin=1 THEN
            Path_recogida_superior;
            Path_descarga_inferior;
        ENDIF
    ENDPROC
    PROC Path_recogida()
        MoveJ Target_30,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
        MoveL Target_20,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
        MoveL Target_70,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
        SetDO Q_ventosa,1;
        WaitTime 1;
        MoveL Target_20,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
        MoveL Target_30,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
    ENDPROC
    PROC Path_descarga()
        MoveJ Target_60,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        MoveL Target_50,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        MoveL Target_40,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        WaitTime 1;
        MoveL Target_50,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        SetDO Q_ventosa,0;
        MoveL Target_60,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        MoveJ Home,v1000,z100,TCP_Ventosa\WObj:=WO_descargar;
    ENDPROC
    PROC Path_recogida_superior()
        MoveJ Target_60,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        MoveL Target_50,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        MoveL Target_40,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        SetDO Q_ventosa,1;
        WaitTime 1;
        MoveL Target_50,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
        MoveL Target_60,v500,z0,TCP_Ventosa\WObj:=WO_descargar;
    ENDPROC
    PROC Path_descarga_inferior()
        MoveJ Target_30,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
        MoveL Target_20,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
        MoveL Target_70,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
        WaitTime 1;
        MoveL Target_20,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
        SetDO Q_ventosa,0;
        MoveL Target_30,v500,z0,TCP_Ventosa\WObj:=WO_recoger;
    ENDPROC
ENDMODULE