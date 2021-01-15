syms Q1 Q2 Q3 Q4 Q5 Q6 R11 R12 R13 R21 R22 R23 R31 R32 R33 Px Py Pz H1 D2 L2 D4 L1 D3 Q11 Q22 Q33 Q44 Q55 Q66 d_th1 d_th2 d_th3 d_th4 d_th5 d_th6 L3
Z = [0,0,1];

%%ROTAASYON  İCİN
R01 = T01(1:3,1:3);
P01 = T01(1:3,4);
R12 = T12(1:3,1:3);
P12 = T12(1:3,4);
R23 = T23(1:3,1:3);
P23 = T23(1:3,4);
R34 = T34(1:3,1:3);
P34 = T34(1:3,4);
R45 = T45(1:3,1:3);
P45 = T45(1:3,4);
R56 = T56(1:3,1:3);
P56 = T56(1:3,4);
% R03=R01*R12*R23;
R06 = R01*R12*R23*R34*R45*R56 ;  

%%HIZ DENKLEMLERI
w_00 = [0;0;0] ; v_00 = [0;0;0] ;
w_11 = (R01.')*w_00 + d_th1*[0;0;1] ;  
v_11 = (R01.')*(v_00+cross(w_00,P01)) ;
w_22 = (R12.')*w_11 + d_th2*[0;0;1]   ;
v_22 = (R12.')*(v_11+cross(w_11,P12)) ;
w_33 = (R23.')*w_22 + d_th3*[0;0;1]  ;
v_33 = (R23.')*(v_22+cross(w_22,P23)) ;
w_44 = (R34.')*w_33 + d_th4*[0;0;1]   ;
v_44 = (R34.')*(v_33+cross(w_33,P34)) ;
w_55 = (R45.')*w_44 + d_th5*[0;0;1] ;  
v_55 = (R45.')*(v_44+cross(w_44,P45)) ;
w_66 = (R56.')*w_55 + d_th6*[0;0;1] ;  
v_66 = (R56.')*(v_55+cross(w_55,P56)) ;
% w_03=R03*w_33;
% v_03=R03*v_33;
w_06 = R06*w_66  ;
v_06 = R06*v_66 ;

%%TUREV ALINAN YER
jacob_v1 = diff(v_06,d_th1) ; 
jacob_v2 = diff(v_06,d_th2) ; 
jacob_v3 = diff(v_06,d_th3) ;
jacob_v4 = diff(v_06,d_th4) ; 
jacob_v5 = diff(v_06,d_th5) ; 
jacob_v6 = diff(v_06,d_th6) ;
jacob_v = [jacob_v1,jacob_v2,jacob_v3,jacob_v4,jacob_v5,jacob_v6];

jacob_w1 = diff(w_06,d_th1) ; 
jacob_w2 = diff(w_06,d_th2) ;
jacob_w3 = diff(w_06,d_th3) ;
jacob_w4 = diff(w_06,d_th4) ; 
jacob_w5 = diff(w_06,d_th5) ; 
jacob_w6 = diff(w_06,d_th6) ;
jacob_w = [jacob_w1,jacob_w2,jacob_w3,jacob_w4,jacob_w5,jacob_w6] ;
J1=[(jacob_v)];
J2=[(jacob_w)];
J = [(jacob_v);(jacob_w)] ;