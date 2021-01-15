%% K?NAMET?K DENKLEMLER 
%%
clear all ; close all ; clc ;
syms Q1 Q2 Q3 Q4 Q5 Q6 L2 L3 L4 D2 D6 H1 D4 L1 L2 l1 h2 d1 d2 d3 d5 d6 d4 th1 th2 th3 th4 th5 th6 al1 al2 al3 al4 al5 al6 a1 a2 a3 a4 a5 a6
syms d_th1 d_th2 d_th3 d_th4 d_th5 d_th6
syms l1 l2 d3 d4
alfa = [0;-90;-90;90] ;
a =    [0;0;0;0] ;
d =    [l1;l2;d3;d4] ; 
teta = [th1;th2;0;0] ;
Dh = DHmatris(alfa,a,d,teta) 
[T01, T12, T23, T34, T04] = IleriKinematik(alfa,a,d,teta) 


 






