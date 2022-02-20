(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 11.2' *)

(***************************************************************************)
(*                                                                         *)
(*                                                                         *)
(*  Under the Wolfram FreeCDF terms of use, this file and its content are  *)
(*  bound by the Creative Commons BY-SA Attribution-ShareAlike license.    *)
(*                                                                         *)
(*        For additional information concerning CDF licensing, see:        *)
(*                                                                         *)
(*         www.wolfram.com/cdf/adopting-cdf/licensing-options.html         *)
(*                                                                         *)
(*                                                                         *)
(***************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1088,         20]
NotebookDataLength[     96706,       2132]
NotebookOptionsPosition[     93021,       2067]
NotebookOutlinePosition[     93542,       2090]
CellTagsIndexPosition[     93499,       2087]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell["\<\

In this notebook, we calculate the local selection gradient for our model \
with assortative interactions studied in Section B.3 in the appendix. These \
calculations are used to produce Equation (B.14), which, in turn, is used to \
calculate the evolutionarily stable sociality strategy for a given assortment \
probability \[Rho].\
\>", "Text",ExpressionUUID->"7a3bb90e-6b81-41a3-9b83-31d710265e30"],

Cell["\<\
First, we introduce the equilibrium level of contagion I_M for the rare \
mutant population with sociality strategy corresponding to reproduction \
number M for the good contagion, given the resident level of sociality \
strategy with reproduction number R for the good contagion. This expression \
was calculated in the adaptive dynamics limit for the good contagion in \
Equation (B.12) and for the bad contagion in Equation (B.13). \
\>", "Text",ExpressionUUID->"b5115b27-8ca8-4008-9353-ff6fe3a2e98a"],

Cell[BoxData[
 RowBox[{
  RowBox[{"ImMinus", "[", 
   RowBox[{"M_", ",", "R_", ",", "\[Rho]_"}], "]"}], " ", ":=", " ", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"-", "1"}], "+", "M", "-", 
     RowBox[{"2", " ", "M", " ", "\[Rho]"}], "-", 
     SqrtBox[
      RowBox[{
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "-", "M", "+", 
          RowBox[{"2", " ", "M", " ", "\[Rho]"}], "+", 
          FractionBox["M", "R"], "-", 
          FractionBox[
           RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}], "2"], "+", 
       RowBox[{"4", " ", "M", " ", "\[Rho]", " ", 
        RowBox[{"(", 
         RowBox[{"M", "-", 
          RowBox[{"M", " ", "\[Rho]"}], "-", 
          FractionBox["M", "R"], "+", 
          FractionBox[
           RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}]], "-", 
     FractionBox["M", "R"], "+", 
     FractionBox[
      RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}], " ", "/", " ", 
   RowBox[{"(", 
    RowBox[{"2", " ", "M", " ", "\[Rho]"}], ")"}]}]}]], "Input",ExpressionUUID\
->"cfb45224-a736-46ae-882d-6ddddf085689"],

Cell["\<\
Next, we compute the Cobb-Douglas utility for the mutant population given the \
equilibrium levels of the good and bad contagion.\
\>", "Text",ExpressionUUID->"f803ee86-636d-445b-beaa-0ee6ac6f59dd"],

Cell[BoxData[
 RowBox[{
  RowBox[{"Utility", "[", 
   RowBox[{"M_", ",", "R_", ",", "\[Rho]_", ",", "\[Alpha]_", ",", "c_"}], 
   "]"}], ":=", " ", 
  RowBox[{
   RowBox[{"\[Alpha]", " ", 
    RowBox[{"Log", "[", 
     RowBox[{"ImMinus", "[", 
      RowBox[{"M", ",", "R", ",", "\[Rho]"}], "]"}], "]"}]}], " ", "+", " ", 
   RowBox[{
    RowBox[{"(", 
     RowBox[{"1", " ", "-", " ", "\[Alpha]"}], ")"}], " ", 
    RowBox[{"Log", "[", 
     RowBox[{"1", " ", "-", " ", 
      RowBox[{"ImMinus", "[", 
       RowBox[{
        RowBox[{"c", " ", "M"}], ",", 
        RowBox[{"c", " ", "R"}], ",", "\[Rho]"}], "]"}]}], "]"}], 
    " "}]}]}]], "Input",ExpressionUUID->"fbf09981-720a-4f02-9c6d-\
aa0e236a9274"],

Cell["\<\
To calculate the local selection gradient, we first differentiate the utility \
for mutant individuals with respect to the mutant reproduction number M, \
given a fixed resident reproduction number R.\
\>", "Text",ExpressionUUID->"fb1e440b-ca8a-4614-bfa8-5717fbb3b55f"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"D", "[", 
   RowBox[{
    RowBox[{"Utility", "[", 
     RowBox[{"M", ",", "R", ",", "\[Rho]", ",", "\[Alpha]", ",", "c"}], "]"}],
     ",", "M"}], "]"}], " "}]], "Input",ExpressionUUID->"b5d1d844-5bdb-42c2-\
814e-31b32a1d7776"],

Cell[BoxData[
 RowBox[{
  RowBox[{"-", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"2", " ", "M", " ", "\[Alpha]", " ", "\[Rho]", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", 
          RowBox[{
           FractionBox["1", 
            RowBox[{"2", " ", "M", " ", "\[Rho]"}]], 
           RowBox[{"(", 
            RowBox[{"1", "-", 
             FractionBox["1", "R"], "-", 
             RowBox[{"2", " ", "\[Rho]"}], "+", 
             FractionBox["\[Rho]", "R"], "-", 
             RowBox[{
              RowBox[{"(", 
               RowBox[{
                RowBox[{"4", " ", "M", " ", "\[Rho]", " ", 
                 RowBox[{"(", 
                  RowBox[{"1", "-", 
                   FractionBox["1", "R"], "-", "\[Rho]", "+", 
                   FractionBox["\[Rho]", "R"]}], ")"}]}], "+", 
                RowBox[{"2", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"-", "1"}], "+", 
                   FractionBox["1", "R"], "+", 
                   RowBox[{"2", " ", "\[Rho]"}], "-", 
                   FractionBox["\[Rho]", "R"]}], ")"}], " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"-", "1"}], "-", "M", "+", 
                   FractionBox["M", "R"], "+", 
                   RowBox[{"2", " ", "M", " ", "\[Rho]"}], "-", 
                   FractionBox[
                    RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}], "+", 
                RowBox[{"4", " ", "\[Rho]", " ", 
                 RowBox[{"(", 
                  RowBox[{"M", "-", 
                   FractionBox["M", "R"], "-", 
                   RowBox[{"M", " ", "\[Rho]"}], "+", 
                   FractionBox[
                    RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}], ")"}], 
              "/", 
              RowBox[{"(", 
               RowBox[{"2", " ", 
                RowBox[{"\[Sqrt]", 
                 RowBox[{"(", 
                  RowBox[{
                   SuperscriptBox[
                    RowBox[{"(", 
                    RowBox[{
                    RowBox[{"-", "1"}], "-", "M", "+", 
                    FractionBox["M", "R"], "+", 
                    RowBox[{"2", " ", "M", " ", "\[Rho]"}], "-", 
                    FractionBox[
                    RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}], "2"], "+", 
                   RowBox[{"4", " ", "M", " ", "\[Rho]", " ", 
                    RowBox[{"(", 
                    RowBox[{"M", "-", 
                    FractionBox["M", "R"], "-", 
                    RowBox[{"M", " ", "\[Rho]"}], "+", 
                    FractionBox[
                    RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}], 
                  ")"}]}]}], ")"}]}]}], ")"}]}]}], "+", 
         RowBox[{
          FractionBox["1", 
           RowBox[{"2", " ", 
            SuperscriptBox["M", "2"], " ", "\[Rho]"}]], 
          RowBox[{"(", 
           RowBox[{"1", "+", "M", "-", 
            FractionBox["M", "R"], "-", 
            RowBox[{"2", " ", "M", " ", "\[Rho]"}], "+", 
            FractionBox[
             RowBox[{"M", " ", "\[Rho]"}], "R"], "-", 
            RowBox[{"\[Sqrt]", 
             RowBox[{"(", 
              RowBox[{
               SuperscriptBox[
                RowBox[{"(", 
                 RowBox[{
                  RowBox[{"-", "1"}], "-", "M", "+", 
                  FractionBox["M", "R"], "+", 
                  RowBox[{"2", " ", "M", " ", "\[Rho]"}], "-", 
                  FractionBox[
                   RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}], "2"], "+", 
               RowBox[{"4", " ", "M", " ", "\[Rho]", " ", 
                RowBox[{"(", 
                 RowBox[{"M", "-", 
                  FractionBox["M", "R"], "-", 
                  RowBox[{"M", " ", "\[Rho]"}], "+", 
                  FractionBox[
                   RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}], ")"}]}]}],
            ")"}]}]}], ")"}]}], ")"}], "/", 
     RowBox[{"(", 
      RowBox[{"1", "+", "M", "-", 
       FractionBox["M", "R"], "-", 
       RowBox[{"2", " ", "M", " ", "\[Rho]"}], "+", 
       FractionBox[
        RowBox[{"M", " ", "\[Rho]"}], "R"], "-", 
       SqrtBox[
        RowBox[{
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{"-", "1"}], "-", "M", "+", 
            FractionBox["M", "R"], "+", 
            RowBox[{"2", " ", "M", " ", "\[Rho]"}], "-", 
            FractionBox[
             RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}], "2"], "+", 
         RowBox[{"4", " ", "M", " ", "\[Rho]", " ", 
          RowBox[{"(", 
           RowBox[{"M", "-", 
            FractionBox["M", "R"], "-", 
            RowBox[{"M", " ", "\[Rho]"}], "+", 
            FractionBox[
             RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}]]}], ")"}]}], 
    ")"}]}], "+", 
  RowBox[{
   RowBox[{"(", 
    RowBox[{
     RowBox[{"(", 
      RowBox[{"1", "-", "\[Alpha]"}], ")"}], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{
        FractionBox["1", 
         RowBox[{"2", " ", "c", " ", "M", " ", "\[Rho]"}]], 
        RowBox[{"(", 
         RowBox[{"c", "-", 
          FractionBox["1", "R"], "-", 
          RowBox[{"2", " ", "c", " ", "\[Rho]"}], "+", 
          FractionBox["\[Rho]", "R"], "-", 
          RowBox[{
           RowBox[{"(", 
            RowBox[{
             RowBox[{"4", " ", "c", " ", "M", " ", "\[Rho]", " ", 
              RowBox[{"(", 
               RowBox[{"c", "-", 
                FractionBox["1", "R"], "-", 
                RowBox[{"c", " ", "\[Rho]"}], "+", 
                FractionBox["\[Rho]", "R"]}], ")"}]}], "+", 
             RowBox[{"2", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "c"}], "+", 
                FractionBox["1", "R"], "+", 
                RowBox[{"2", " ", "c", " ", "\[Rho]"}], "-", 
                FractionBox["\[Rho]", "R"]}], ")"}], " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "1"}], "-", 
                RowBox[{"c", " ", "M"}], "+", 
                FractionBox["M", "R"], "+", 
                RowBox[{"2", " ", "c", " ", "M", " ", "\[Rho]"}], "-", 
                FractionBox[
                 RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}], "+", 
             RowBox[{"4", " ", "c", " ", "\[Rho]", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"c", " ", "M"}], "-", 
                FractionBox["M", "R"], "-", 
                RowBox[{"c", " ", "M", " ", "\[Rho]"}], "+", 
                FractionBox[
                 RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}], ")"}], "/", 
           
           RowBox[{"(", 
            RowBox[{"2", " ", 
             RowBox[{"\[Sqrt]", 
              RowBox[{"(", 
               RowBox[{
                SuperscriptBox[
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"-", "1"}], "-", 
                   RowBox[{"c", " ", "M"}], "+", 
                   FractionBox["M", "R"], "+", 
                   RowBox[{"2", " ", "c", " ", "M", " ", "\[Rho]"}], "-", 
                   FractionBox[
                    RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}], "2"], "+", 
                RowBox[{"4", " ", "c", " ", "M", " ", "\[Rho]", " ", 
                 RowBox[{"(", 
                  RowBox[{
                   RowBox[{"c", " ", "M"}], "-", 
                   FractionBox["M", "R"], "-", 
                   RowBox[{"c", " ", "M", " ", "\[Rho]"}], "+", 
                   FractionBox[
                    RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}], 
               ")"}]}]}], ")"}]}]}], ")"}]}], "-", 
       RowBox[{
        FractionBox["1", 
         RowBox[{"2", " ", "c", " ", 
          SuperscriptBox["M", "2"], " ", "\[Rho]"}]], 
        RowBox[{"(", 
         RowBox[{"1", "+", 
          RowBox[{"c", " ", "M"}], "-", 
          FractionBox["M", "R"], "-", 
          RowBox[{"2", " ", "c", " ", "M", " ", "\[Rho]"}], "+", 
          FractionBox[
           RowBox[{"M", " ", "\[Rho]"}], "R"], "-", 
          RowBox[{"\[Sqrt]", 
           RowBox[{"(", 
            RowBox[{
             SuperscriptBox[
              RowBox[{"(", 
               RowBox[{
                RowBox[{"-", "1"}], "-", 
                RowBox[{"c", " ", "M"}], "+", 
                FractionBox["M", "R"], "+", 
                RowBox[{"2", " ", "c", " ", "M", " ", "\[Rho]"}], "-", 
                FractionBox[
                 RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}], "2"], "+", 
             RowBox[{"4", " ", "c", " ", "M", " ", "\[Rho]", " ", 
              RowBox[{"(", 
               RowBox[{
                RowBox[{"c", " ", "M"}], "-", 
                FractionBox["M", "R"], "-", 
                RowBox[{"c", " ", "M", " ", "\[Rho]"}], "+", 
                FractionBox[
                 RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}], ")"}]}]}], 
         ")"}]}]}], ")"}]}], ")"}], "/", 
   RowBox[{"(", 
    RowBox[{"1", "+", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"2", " ", "c", " ", "M", " ", "\[Rho]"}]], 
      RowBox[{"(", 
       RowBox[{"1", "+", 
        RowBox[{"c", " ", "M"}], "-", 
        FractionBox["M", "R"], "-", 
        RowBox[{"2", " ", "c", " ", "M", " ", "\[Rho]"}], "+", 
        FractionBox[
         RowBox[{"M", " ", "\[Rho]"}], "R"], "-", 
        RowBox[{"\[Sqrt]", 
         RowBox[{"(", 
          RowBox[{
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{
              RowBox[{"-", "1"}], "-", 
              RowBox[{"c", " ", "M"}], "+", 
              FractionBox["M", "R"], "+", 
              RowBox[{"2", " ", "c", " ", "M", " ", "\[Rho]"}], "-", 
              FractionBox[
               RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}], "2"], "+", 
           RowBox[{"4", " ", "c", " ", "M", " ", "\[Rho]", " ", 
            RowBox[{"(", 
             RowBox[{
              RowBox[{"c", " ", "M"}], "-", 
              FractionBox["M", "R"], "-", 
              RowBox[{"c", " ", "M", " ", "\[Rho]"}], "+", 
              FractionBox[
               RowBox[{"M", " ", "\[Rho]"}], "R"]}], ")"}]}]}], ")"}]}]}], 
       ")"}]}]}], ")"}]}]}]], "Output",ExpressionUUID->"6768e8df-99c6-45fd-\
ae25-64b5c0d4a672"]
}, Open  ]],

Cell[BoxData[""], "Input",ExpressionUUID->"8e7f0d22-f3f6-406e-a839-071ed5193969"],

Cell["\<\
To further calculate the local selection gradient, we evaluate the derivative \
of the mutant utility with respect to mutant reproduction number M for the \
case in which the mutant and resident reproduction numbers coincide (M = R). \
This allows us to see whether utility will increase or decrease for a mutant \
with sociality strategy near the resident sociality strategy. \
\>", "Text",ExpressionUUID->"7e2b3646-c3f9-478f-b009-edbf3cfb7f62"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{
   RowBox[{"D", "[", 
    RowBox[{
     RowBox[{"Utility", "[", 
      RowBox[{"M", ",", "R", ",", "\[Rho]", ",", "\[Alpha]", ",", "c"}], 
      "]"}], ",", "M"}], "]"}], " ", "/.", 
   RowBox[{"{", 
    RowBox[{"M", "\[Rule]", "R"}], "}"}]}], " ", "//", 
  "FullSimplify"}]], "Input",ExpressionUUID->"92444f04-d049-4452-8108-\
2ce986e7909f"],

Cell[BoxData[
 RowBox[{"-", 
  FractionBox[
   RowBox[{
    FractionBox[
     RowBox[{
      RowBox[{"-", "2"}], "+", 
      RowBox[{"c", " ", "R"}], "+", "\[Rho]", "+", 
      SqrtBox[
       SuperscriptBox[
        RowBox[{"(", 
         RowBox[{
          RowBox[{
           RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]}], 
     SqrtBox[
      SuperscriptBox[
       RowBox[{"(", 
        RowBox[{
         RowBox[{
          RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]], "+", 
    RowBox[{"\[Alpha]", " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "1"}], "-", 
       FractionBox["2", 
        SqrtBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{"R", "-", "\[Rho]"}], ")"}], "2"]]], "+", 
       FractionBox["2", 
        SqrtBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]], 
       "-", 
       FractionBox[
        RowBox[{
         RowBox[{"c", " ", "R"}], "+", "\[Rho]"}], 
        SqrtBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]]}],
       ")"}]}]}], 
   RowBox[{"2", " ", "R"}]]}]], "Output",ExpressionUUID->"cf0fc4ef-19b0-4539-\
b302-12a471154311"]
}, Open  ]],

Cell[BoxData[""], "Input",ExpressionUUID->"cef55120-e829-447b-b749-3ff0626620ff"],

Cell["\<\
We can simplify the expression for the local selection gradient using the \
fact that reproduction numbers for the good contagion always satisfy R >= 1. \
In addition, we will assume that cR > \[Rho], which simplifies our \
expression. This second assumption is justified if we restrict attention to \
cases in which the socially optimal sociality strategy is achieved at a \
critical point of the monomorphic utility function (i.e. R_{opt} > 1 / c, \
which occurs when c > 1 - \[Alpha]).  \
\>", "Text",ExpressionUUID->"0c85a68a-e3f6-43da-8fc2-377e4dbc30d8"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"FullSimplify", "[", 
  RowBox[{
   RowBox[{"-", 
    RowBox[{
     FractionBox["1", 
      RowBox[{"2", " ", "R"}]], 
     RowBox[{"(", 
      RowBox[{
       FractionBox[
        RowBox[{
         RowBox[{"-", "2"}], "+", 
         RowBox[{"c", " ", "R"}], "+", "\[Rho]", "+", 
         SqrtBox[
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{
             RowBox[{
              RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]}], 
        SqrtBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]], 
       "+", 
       RowBox[{"\[Alpha]", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "-", 
          FractionBox["2", 
           SqrtBox[
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{"R", "-", "\[Rho]"}], ")"}], "2"]]], "+", 
          FractionBox["2", 
           SqrtBox[
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{
                RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], 
             "2"]]], "-", 
          FractionBox[
           RowBox[{
            RowBox[{"c", " ", "R"}], "+", "\[Rho]"}], 
           SqrtBox[
            SuperscriptBox[
             RowBox[{"(", 
              RowBox[{
               RowBox[{
                RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], 
             "2"]]]}], ")"}]}]}], ")"}]}]}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"R", "-", "\[Rho]"}], " ", ">", " ", "0"}], ",", " ", 
     RowBox[{
      RowBox[{
       RowBox[{"c", " ", "R"}], " ", "-", " ", "\[Rho]"}], " ", ">", " ", 
      "0"}]}], "}"}]}], "]"}]], "Input",ExpressionUUID->"34940c44-c680-4b15-\
a7a2-360c4dd6d741"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   FractionBox["\[Alpha]", 
    RowBox[{"R", "-", "\[Rho]"}]], "+", 
   FractionBox[
    RowBox[{
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "1"}], "+", 
       RowBox[{"c", " ", "R"}]}], ")"}], " ", 
     RowBox[{"(", 
      RowBox[{
       RowBox[{"-", "1"}], "+", "\[Alpha]"}], ")"}]}], 
    RowBox[{
     RowBox[{"c", " ", "R"}], "-", "\[Rho]"}]]}], "R"]], "Output",ExpressionUU\
ID->"be2e3769-8f07-4e47-98a9-163679999e19"]
}, Open  ]],

Cell[BoxData[""], "Text", "Input",ExpressionUUID->"2b9632b3-f360-4f0d-af96-cf2eaa79e9c1"],

Cell["\<\
In the next two steps, we simplify the expression for the local selection \
gradient to obtain the formula presented in Equation (B.14) in the appendix.\
\>", "Text",ExpressionUUID->"a896bb13-e3d4-4b43-bb97-7d410b2f9532"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Together", "[", 
  FractionBox[
   RowBox[{
    FractionBox["\[Alpha]", 
     RowBox[{"R", "-", "\[Rho]"}]], "+", 
    FractionBox[
     RowBox[{
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", 
        RowBox[{"c", " ", "R"}]}], ")"}], " ", 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "\[Alpha]"}], ")"}]}], 
     RowBox[{
      RowBox[{"c", " ", "R"}], "-", "\[Rho]"}]]}], "R"], "]"}]], "Input",Expre\
ssionUUID->"e5ccd473-2521-4a36-b6df-50e19f146394"],

Cell[BoxData[
 FractionBox[
  RowBox[{"R", "-", 
   RowBox[{"c", " ", 
    SuperscriptBox["R", "2"]}], "-", 
   RowBox[{"R", " ", "\[Alpha]"}], "+", 
   RowBox[{"c", " ", "R", " ", "\[Alpha]"}], "+", 
   RowBox[{"c", " ", 
    SuperscriptBox["R", "2"], " ", "\[Alpha]"}], "-", "\[Rho]", "+", 
   RowBox[{"c", " ", "R", " ", "\[Rho]"}], "-", 
   RowBox[{"c", " ", "R", " ", "\[Alpha]", " ", "\[Rho]"}]}], 
  RowBox[{"R", " ", 
   RowBox[{"(", 
    RowBox[{"R", "-", "\[Rho]"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"c", " ", "R"}], "-", "\[Rho]"}], ")"}]}]]], "Output",ExpressionU\
UID->"1e883462-a177-4e65-8142-ab2c55e55a55"]
}, Open  ]],

Cell[BoxData[""], "Input",ExpressionUUID->"661b6c07-9899-43c2-8a42-54e7eaa616c3"],

Cell[BoxData[""], "Input",ExpressionUUID->"3446029a-34e9-438e-866e-9feaf07860ea"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Collect", "[", 
   RowBox[{
    RowBox[{"R", "-", 
     RowBox[{"c", " ", 
      SuperscriptBox["R", "2"]}], "-", 
     RowBox[{"R", " ", "\[Alpha]"}], "+", 
     RowBox[{"c", " ", "R", " ", "\[Alpha]"}], "+", 
     RowBox[{"c", " ", 
      SuperscriptBox["R", "2"], " ", "\[Alpha]"}], "-", "\[Rho]", "+", 
     RowBox[{"c", " ", "R", " ", "\[Rho]"}], "-", 
     RowBox[{"c", " ", "R", " ", "\[Alpha]", " ", "\[Rho]"}]}], ",", "R"}], 
   "]"}], " ", "/", 
  RowBox[{"(", 
   RowBox[{"R", " ", 
    RowBox[{"(", 
     RowBox[{"R", "-", "\[Rho]"}], ")"}], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"c", " ", "R"}], "-", "\[Rho]"}], ")"}]}], ")"}], 
  " "}]], "Input", \
"Input",ExpressionUUID->"975c297a-e39a-4e28-a211-f22b5dd499a4"],

Cell[BoxData[
 FractionBox[
  RowBox[{
   RowBox[{
    SuperscriptBox["R", "2"], " ", 
    RowBox[{"(", 
     RowBox[{
      RowBox[{"-", "c"}], "+", 
      RowBox[{"c", " ", "\[Alpha]"}]}], ")"}]}], "-", "\[Rho]", "+", 
   RowBox[{"R", " ", 
    RowBox[{"(", 
     RowBox[{"1", "-", "\[Alpha]", "+", 
      RowBox[{"c", " ", "\[Alpha]"}], "+", 
      RowBox[{"c", " ", "\[Rho]"}], "-", 
      RowBox[{"c", " ", "\[Alpha]", " ", "\[Rho]"}]}], ")"}]}]}], 
  RowBox[{"R", " ", 
   RowBox[{"(", 
    RowBox[{"R", "-", "\[Rho]"}], ")"}], " ", 
   RowBox[{"(", 
    RowBox[{
     RowBox[{"c", " ", "R"}], "-", "\[Rho]"}], ")"}]}]]], "Output",ExpressionU\
UID->"68d6b8b5-a745-434c-a117-19415bb4da9c"]
}, Open  ]],

Cell[BoxData[""], "Input",ExpressionUUID->"1c3d6696-e525-456c-87d6-2dc9c02643ae"],

Cell[BoxData[""], "Input",ExpressionUUID->"77f50ea4-1b85-4b0d-9b1e-8601b783359d"],

Cell[BoxData[""], "Input",ExpressionUUID->"86b492dc-0419-4a91-b01b-b617d9aa2bcc"],

Cell[BoxData[""], "Input",ExpressionUUID->"25eb90b2-ccfd-4d8a-8def-f4f92761b919"],

Cell["\<\
Next, we set the selection gradient equal to zero to calculate the \
evolutionarily stable sociality strategy for a given assortment probability \
\[Rho]. We can use the fact that the numerator of the selection gradient is a \
decreasing function of R to see that the positive root (listed second) is the \
unique ESS. \
\>", "Text",ExpressionUUID->"c5036a1c-8f40-4a93-817d-2e0118c0e4ae"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Solve", "[", 
  RowBox[{
   RowBox[{
    FractionBox[
     RowBox[{
      FractionBox["\[Alpha]", 
       RowBox[{"R", "-", "\[Rho]"}]], "+", 
      FractionBox[
       RowBox[{
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", 
          RowBox[{"c", " ", "R"}]}], ")"}], " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "1"}], "+", "\[Alpha]"}], ")"}]}], 
       RowBox[{
        RowBox[{"c", " ", "R"}], "-", "\[Rho]"}]]}], "R"], "\[Equal]", "0"}], 
   ",", "R"}], "]"}]], "Input",ExpressionUUID->"72e66b61-5c50-41ed-957f-\
6bea97de478b"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"R", "\[Rule]", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"2", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "c"}], "+", 
          RowBox[{"c", " ", "\[Alpha]"}]}], ")"}]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "\[Alpha]", "-", 
        RowBox[{"c", " ", "\[Alpha]"}], "-", 
        RowBox[{"c", " ", "\[Rho]"}], "+", 
        RowBox[{"c", " ", "\[Alpha]", " ", "\[Rho]"}], "-", 
        SqrtBox[
         RowBox[{
          RowBox[{"4", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "c"}], "+", 
             RowBox[{"c", " ", "\[Alpha]"}]}], ")"}], " ", "\[Rho]"}], "+", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"1", "-", "\[Alpha]", "+", 
             RowBox[{"c", " ", "\[Alpha]"}], "+", 
             RowBox[{"c", " ", "\[Rho]"}], "-", 
             RowBox[{"c", " ", "\[Alpha]", " ", "\[Rho]"}]}], ")"}], 
           "2"]}]]}], ")"}]}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"R", "\[Rule]", 
     RowBox[{
      FractionBox["1", 
       RowBox[{"2", " ", 
        RowBox[{"(", 
         RowBox[{
          RowBox[{"-", "c"}], "+", 
          RowBox[{"c", " ", "\[Alpha]"}]}], ")"}]}]], 
      RowBox[{"(", 
       RowBox[{
        RowBox[{"-", "1"}], "+", "\[Alpha]", "-", 
        RowBox[{"c", " ", "\[Alpha]"}], "-", 
        RowBox[{"c", " ", "\[Rho]"}], "+", 
        RowBox[{"c", " ", "\[Alpha]", " ", "\[Rho]"}], "+", 
        SqrtBox[
         RowBox[{
          RowBox[{"4", " ", 
           RowBox[{"(", 
            RowBox[{
             RowBox[{"-", "c"}], "+", 
             RowBox[{"c", " ", "\[Alpha]"}]}], ")"}], " ", "\[Rho]"}], "+", 
          SuperscriptBox[
           RowBox[{"(", 
            RowBox[{"1", "-", "\[Alpha]", "+", 
             RowBox[{"c", " ", "\[Alpha]"}], "+", 
             RowBox[{"c", " ", "\[Rho]"}], "-", 
             RowBox[{"c", " ", "\[Alpha]", " ", "\[Rho]"}]}], ")"}], 
           "2"]}]]}], ")"}]}]}], "}"}]}], "}"}]], "Output",ExpressionUUID->\
"e67c251c-b5da-40f9-9b9a-0880c38c906f"]
}, Open  ]],

Cell[BoxData[
 RowBox[{"\[IndentingNewLine]", "\[IndentingNewLine]", "\[IndentingNewLine]", 
  "\[IndentingNewLine]"}]], "Input",ExpressionUUID->"f1549858-5c7c-43f8-beb4-\
f6aa72bce2b2"],

Cell["\<\
Introducing shorthand to calculate the regions in which the local selection \
gradient is positive or negative (given assortment probability \[Rho]).\
\>", "Text",ExpressionUUID->"c0b2e75a-8a74-401c-bbf0-7fe4778bd104"],

Cell[BoxData[
 RowBox[{
  RowBox[{"G", "[", 
   RowBox[{"R_", ",", "p_", ",", "c_", ",", "\[Alpha]_"}], "]"}], ":=", 
  RowBox[{"-", 
   RowBox[{
    FractionBox["1", 
     RowBox[{"2", " ", "R"}]], 
    RowBox[{"(", 
     RowBox[{
      FractionBox[
       RowBox[{
        RowBox[{"-", "2"}], "+", 
        RowBox[{"c", " ", "R"}], "+", "\[Rho]", "+", 
        SqrtBox[
         SuperscriptBox[
          RowBox[{"(", 
           RowBox[{
            RowBox[{
             RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]}], 
       
       SqrtBox[
        SuperscriptBox[
         RowBox[{"(", 
          RowBox[{
           RowBox[{
            RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]], 
      "+", 
      RowBox[{"\[Alpha]", " ", 
       RowBox[{"(", 
        RowBox[{
         RowBox[{"-", "1"}], "-", 
         FractionBox["2", 
          SqrtBox[
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{"R", "-", "\[Rho]"}], ")"}], "2"]]], "+", 
         FractionBox["2", 
          SqrtBox[
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{
              RowBox[{
               RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], "2"]]],
          "-", 
         FractionBox[
          RowBox[{
           RowBox[{"c", " ", "R"}], "+", "\[Rho]"}], 
          SqrtBox[
           SuperscriptBox[
            RowBox[{"(", 
             RowBox[{
              RowBox[{
               RowBox[{"-", "c"}], " ", "R"}], "+", "\[Rho]"}], ")"}], 
            "2"]]]}], ")"}]}]}], ")"}]}]}]}]], "Input",ExpressionUUID->\
"88372109-89de-44b7-bfa1-46e39e994271"],

Cell["\<\



Plot of regions in which local selection gradient is increasing (filled in \
blue) and decreasing (filled in orange) depending on the resident sociality \
reproduction number R and the assortment probability \[Rho]. The boundary \
between the regions corresponds to the ESS sociality strategy. In first plot, \
we consider case in which c = 1/2, so the ESS with no assortative \
interactions (\[Rho] = 0) features more interactions than experienced by the \
socially optimal sociality strategy. \
\>", "Text",ExpressionUUID->"d69b0a87-1627-46f6-8019-f1560463d1c8"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"RegionPlot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"G", "[", 
       RowBox[{"R", ",", "\[Rho]", ",", 
        RowBox[{"1", "/", "2"}], ",", 
        RowBox[{"3", "/", "4"}]}], "]"}], ">", " ", "0"}], " ", ",", " ", 
     RowBox[{
      RowBox[{"G", "[", 
       RowBox[{"R", ",", "\[Rho]", ",", 
        RowBox[{"1", "/", "2"}], ",", 
        RowBox[{"3", "/", "4"}]}], "]"}], "<", " ", "0"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"R", ",", "1", ",", "10"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Rho]", ",", "0", ",", "1"}], "}"}], ",", 
   RowBox[{"PlotLegends", "\[Rule]", "\"\<Expressions\>\""}], ",", " ", 
   RowBox[{"FrameLabel", "\[Rule]", 
    RowBox[{"{", " ", 
     RowBox[{
      RowBox[{"Style", "[", 
       RowBox[{"\"\<Resident Sociality Strategy R\>\"", ",", "16"}], "]"}], 
      ",", 
      RowBox[{"Style", "[", 
       RowBox[{"\"\<Assortment Probability \[Rho]\>\"", " ", ",", " ", "16"}],
        "]"}]}], "}"}]}]}], "]"}]], "Input",ExpressionUUID->"e5812543-05aa-\
4439-97d6-618e0a3a6bd1"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[
    GraphicsComplexBox[CompressedData["
1:eJzt2nt4jGfewPEgjWNiDnHoUKGLDhukiJLivkmdKjSxqRJESqltVLyarU1K
6YpxPo8zrUkpEUxeCcE7UnEqoUIaGYlTJJmcRDBUWK1sule+9+xl/3//0n96
fa5nxu97z8wzzzzPk3aTokZNqevm5ta2npvbH/8/GfrWPDe3B6JBYqKXZcD0
/sFjs0b3Mlcp35owt+t0Y7Vyr7e964WE15N4bnJZZaSxvvJp/x/zTM5Gyo2P
mM9abF7Knd7wHxseqFUOuuWTGWnUK9Nz+kL7kMXOvYIeTA+mB9OD6cH0YHow
PZiekadaRC1yHlM9mB5MD6YH04PpwfRgejA9E1ZfCnP4n1Y9mB5MD6YH04Pp
wfRgejA9eqF9YXJmqB5MD6YH04PpwfRgejA9mB7Hk4Rgs/2y6sH0YHowPZge
TA+mB9OD6ZEjh7/p8M9WPZgeTA+mB9OD6cH0YOZv3VXxyN9sV/Mx8zHzMfMx
8zHzMfMx85/8tuKMyZmn5mPmY+Zj5mPmY+Zj5mPmh4R222gPvqXmY+Zj5mPm
Y+Zj5mPmY+bnfDitp9mer+Zj5mPmY+Zj5mPmY+Zj5sfV6bPdZipQ8zHzMfMx
8zHzMfMx8zHzu+9v6OHwL1LzMfMx8zHzMfMx8zHzMfPzx+TN8HQ41HzMfMx8
zHzMfMx8zHzM/JXuiXZ/c4maj5mPmY+Zj5mPmY+Zj5nfN+krGR5YpuZj5mPm
Y+Zj5mPmY+Zj5pePC0owOcvVfMx8zHzMfMx8zHzMvE3139BZLRVqHmYeZh5m
HmYeZh5m3uDke7H24Eo1DzMPMw8zDzMPMw8z72F4WmF19X01DzMPMw8zDzMP
Mw8fm9vZ2+Gvk2vjY4/aTFnq+IbZXvms1TJPx1XloSHHx4cH5irv3BPe1Wq5
ofyi+o//bivvT7w8zWi9IzbaxLf2YI3UexRFOw3lyun/m3LTkHFXOWrCwsGB
MffU8zneYY4/mOMB5vsZ832J+f5iHp8vzPuPeX/qdd31P0arTv71acG94PBf
RP70Y88NGRr5wq/lKpupXG0//UHcjxZbjrLP7g5rnIY85dgXZycFxtxUz993
o7SqyL9C9Vlv9G+21LlFvR94/cotvlaLXsa9mLV9hXOpstcbBfuL/Xeq52/y
vnrB4Z+ino95fL/jPf5pticpP4r8cnsvc6p6ft0+XZaY7SfU8zGPTzAcldeC
05STin5/aDOdVM8/UhLl28v8k3o+ZvuMDQcz7cGX1HbM69NiZ/LoGM+ryrOe
hxozIq8p/zzqyTNDxnX1/oz7yHIlOLxQfT/hWT9bD1tsWjnT9/NUk7NAefA/
rt41ZBSq5zesNysgxtP1/Y55fJtr/dpaLUXKj7v8EBoY41DPTz0w8HuLrVg9
H/P4iwu8ltiDi9Xjp4Tpm2RElqrHYz4POab5p4LD74rSf//ObCJbNxxtjTS6
9l+8reXSb4zWpvLtW+3WW2yVyh49l573N7u2s7/zfnH+gzn/oJfjK+Z4Rz/f
//Qar1vDjNYy8X5Q6+saN291vld68daHbd7Sq/33hwmRmYm/u/bfoMG/bG6R
5dp/r5maH/p4p2v/DfLxb7c02rX/vmeI/ujbAbr/+j2yoOLXyupdZSLg7SHP
wxpr1f7c1xjUUNpc+3NH949bdPjEtT/3n/P+111q+sJtA/pZe2SLy59OyWxc
Ry9t70177D/SLp50OJoyIFcn7060t8+Ykie8oh9nNk7SyVYDEzbZY2+KUt/k
Bvm6mt/jP2pTI38qF7E3FgXlZmpkr/VTy6sDKsSeZg8/nuzUy+Bvzj3Om7lB
HHmSWrq+Qi+LlpeP/r7JDlGQdSC0/y96uWZEfrpb74Pi8J/bbpp9Ti//5Pws
bvr8w8Krb15Ug2S9PJ95eHWvi2kiqEf69aR4vRzYycdmXHBS7T8Plk8aE/N6
tsh5PvuG37uu72/T1RVPAzbo5KVtN+NtobdF6JFVh9In6uT4Mvc455I74lz6
+FtJRp30K/PwM48qFE+mXvKI6KCTKd0fPaueXiiyfFNu+VVp5ZhhHTbbrhaJ
iIR+9SOKtfLA04hJxlCHmNb84Naqk1q57Hff3jGji8WWq/p8jZ9Wfb9vSK1q
fuY7jXTr9M51Q497InZsYeKN3hrp8/cSu0F/XwR0PNz9A1+NXOr2lbNo6H1x
LUfb8jU3jfq8tryUWdrstuvz6pc4fsjrx12fV75Pei76qIGjpEBEF91rV95Y
pz6/lwZt2Jqa9d+f35kPHSHGhEox68Lr+Um+Wrll0dJ8Q7dyMXheZXKdIL1s
1mzZAXvzK6J/JzE0t69etl7VsSByUpZor20aPTREKxOm91tj+6BMOL+YM3mB
Tq+Ojzdyt3RZpdHLrDoVoTFNc8SopiNHtyl1HS+TPo1uu/eOToYfvPKlMT1X
bKj7fPPG//uP42fWhbadaz5fp3bYh8TMvik+W529/OBy1/H0E/vRmw/idDIm
PXtC4OB8sW3A9C2zv9LJw7u/22HbnC8uHsnrGjXOdbwNevj2iqyPdLJb3JTs
4J/viH19ng57PVAnx6z79nl1bIFoHe/e8ESR6/hbPmDc9neyNHKET6nO2rVC
DPSICvt2jet4/OXgMYnbFmnkqC5bZzgT7okUn22rs6Zp5LA3531verdSLA6s
N+TofdfxqvvBgF2tX+jl1FPn+l6w/FUMrrsu9EWBXhb/YH03LWe3+O3Z6T6h
l1zHpwAfa5+UvJrPb/XAL96JOyDaF7dKHnBKL+tVzev36B9HRIScMWlBout4
FHe8R3L6Ib385TWPHa1OHhc7ssuWrq3ZP5yRJyc4lpwUDbL3T1qwyHX8ybO+
756/Ri/31P/1ln3fGaFZcU47aFXN+1uxxGNRx7Oi/fRZ7hFf6WX8vAkx5gvn
hVdUh2VZ8/Uy3yO3zqJL50R8VfamFpNcx6uKmSEzF0fp5Ynti1eH378gFl9O
S67zac37X7jZO2TWzyLg2H6fzqP0cuxyn+nhKy6Ls6OrJhVO0Mu2m8pOOL0y
xellE3Vn+uhlXtPYEeZdWaI4beuNBx31coR31BVT72xxMNhaFeBd02MomGtM
vyoybCs2z36mk/Zlqb2sJXYR4J42efI9nfza41hOZN41EdCno37Q+Zrvz3Fd
/Kxbr4uwpa99Uni65v1fmLfH9uC60BQufHpsi04e3BD42OB+W3iErJ63f0bN
8XjB57M9G90RXnWS+oa+pVPHz1HrvK4M1+jk5BOd+sZ4F4mvK5/MKr3vOj72
lLqK9R46OfOnuvOcE4tE0MoR9SNuamWjuGeDwzc4xGceo1YeTHEdD+fEB49J
O62Vn5/13GkZViwW/3n47SSLVu7za/heuCwRc6Y2Gp67WyvPGfvEOpuViIua
Qwm/RbuOj13Td39xbplWJt3VGM3ZJSLrfOaYtDlauTHy8yYZvUtF2Nxbp4s/
1Erf2QG/F3UvE3mFvVPrRNV8f0WkdzSvLRWffbh37Au3muNDp6I9pi53hVd4
Vv/HDzVy1t3xK2zf3BXzh/2WP3OfRsZ123Pd8KhClLZ7U2b30Kjjrekvy++v
96r5vffG/hzDmZrf3y2vXE/a7LpexvE09bVtTRYdPimufeFe9c9o1/WraRN9
huaOdF0/ij90sX7Eetf53Oqw8VnD/+I6v1r5txF7tkmdzLx5fmzg6gLhNazz
3m3dtXKXZuGnnk3KRd3m9xq2/bjm+zO6e1rwxEoR9V2jQTGezdTxd23Er8dM
zubKh9rl+5ntLZWvFWT8YLEZlJ9/f6i11dJauc2UHWttpjbK7dYNcnf4t1VO
fhTwY6SxnfKgUL9Yp+FNZXtKB/8Yzz8pT2vW6kF1tcv08v1OL6YX04vpxfRi
ejG9mF5ML6YX08vxh15ML6YX04vpxfRiejG9mF5ML6aXzye9mF5ML6YX04vp
xfRiejG9mF5ML/sLvZheTC+mF9OL6cX0YnoxvWr/re3F9LI/04vpxfRiejG9
mF5ML6YX04vpffn6Nb/H6cf0Y/ox/Zh+TD+mH9OP6cf0Y/ox/Zw/0I/px/Rj
+jH9mH5MP6Yf04/px/Sr853afs536Mf0Y/rV+VFtP6Yf04/px/Rj+jH9mH5M
P+dn9GP6Mf2Yfkw/ph/Tj+nH9GP6Mf3qfLK2n/NJ+jH9mH5MP6Yf04/px/Rj
+jH9mH5MP+e/9GP6Mf2Yfkw/ph/Tj+nH9GP6Mf2Yfs7P6Mf0Y/ox/Zh+TD+m
H9OP6cf0Y/ox/ZxP0o/px/Rj+jH9mH5MP6Yf04/px/Rj+vm9ST+mH9OP6cf0
Y/ox/Zh+TD+mH9OP6ef3Mf2Yfkw/ph/Tj+nH9GP6Mf2Yfkz/y/dPuD7FejDr
wawHsx7MejDrwawHsx7MejDrwawHsx7Meri+pq4315r1YNaDWQ9mPZj1YNaD
WQ9mPZj1YNaDWQ9mPVwfZD2Y9WDWg1kPZj2Y9WDWg1kPZj2Y9WDWg1kPZj1c
T2M9mPVg1oNZD2Y9mPVg1oNZD2Y9mPVg1oNZj7r/9cdlJYO3ur6EuX6EuT6E
uf6DuX6DX77fxfUPzPUOzPUMzPUJzPVP9fcsL93v4noCfnl96u+zaq3+PqrW
6u+Taq3+PqjW6u9zas3vf/o4nmGOD5jvW8z3F9c3bEG6hUbrFXV/gOv/zON6
KJ83zHauh7Ids53roWzHbOd6KNsx94fKO/c0ZETmq8er66G1j8c8flOO+wKn
oUCtl+uhvH+Y7VwPZTvmfkjY4qMRno576vVq1Pe7U56OM8pT18n14YHnlU+U
35lqtVx03c+zDGjt5nZZ9XP+w3buP2I+v6zHuHfjhUij6/U4OX/byPDAO+r9
is/98niksUQ5ttvth9XVLgcvHNLRbHfdj4rrHuIb4+laz8vXu/i8YT5v/Ht8
nrD6+4Ta9bG/8f5g+rl/x+vP/sPrj+nlfhg93E9kHudjbOf+Its532E79xvZ
zvkE23m92c7vdbbz+tPP8ZPXg/t96v5t7fGI7bz+/Pv8nubff/n14fuf5/N6
uP37v+bq88L3P+54f1WJv9lbfb4w+zvP5/sT834f+WBhvM3UTD3+1f3AV/cD
X90PfHU/8NX9wFf3A1/dD/z/vx/4L0QBXrQ=
     "], {{{
        EdgeForm[], 
        Directive[
         RGBColor[0.368417, 0.506779, 0.709798], 
         AbsoluteThickness[1.6], 
         Opacity[0.3]], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
f0uCCRA=
           "]], 
          PolygonBox[CompressedData["
1:eJwtk9dOVkEURmcDKthQ1KhoJAhRpEiiYCGCHRWIBesVFzyAvAGXPonYABvY
A0aMGIIQJWowGGwYBUyEqFgQZX3Zc7Fy1vwz/zkz+9uTWVtXfTohhFAGSbDQ
QqiAV/hHSMUT4Rl+HRbjS+Asvgl+wChcgTvwDYahGW5CFmuz4R7eCKX4UmjA
n8AxPAWa8Fb4CjWMP/E8AyPaG+MenpdhAb4PXuBDsAdPgj78KXyP/9Ha2zCP
uXzowN/DTxiDFrgF85krhE78A8zGj8Mg/gZ+wXjcm87wGdYx384zBVbhGXAN
vxDPvs38bM2xNjsY98YaTcAXuAp3YSdzK+B88DWZ+GrzWl+E7fhyOBe8Bv9j
jVVbZVBgfgbt/SH8hhzGbcH3mGZ+Jp3lBhw1z0RZvIYT+Fx4h7+FcnwmvMSf
x1pVm69VzQ7ih2AAr4e95pkoC2VwBD9snt1AzDIZLgXPdL95j6m39I0qvNL8
Xf2Qa56ZsrofPIs55nsbjGf7E+d0RvXSMvOs1VMl+Fbz3uwOXrt0895UDSch
j/GD4D2xHv/H8zE8inN/Yy21ZhdjM89Wme3GE8yzUean8JPq8fiOqfhOvUs9
pbMvMu811UB3ST2rXtWdUvYrzXtBPbAZ32K+9wLYgG+EruDfKMaLzOf02yz8
gHntdGdnmGeo7HRH1uBrzbPXHZsGnRKE6w==
           "]]}]}, {
        EdgeForm[], 
        Directive[
         RGBColor[0.880722, 0.611041, 0.142051], 
         AbsoluteThickness[1.6], 
         Opacity[0.3]], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
mOPZzjPfPf/RyV57KezFkvfD/wAwi82Z
           "]], 
          PolygonBox[CompressedData["
1:eJw1091LVEEYx/HZM4tYaakV5VqiV/0D3fhPqC1pZKWwgiFSK0mkrai5vWwL
gn9D97Xiopbvq7hKeBFpSURliimFkmaZ9ub3YZ4uPszMmZ0zM8/5bXEoHLzu
GWNK4Mcqg0+4hWZ8wRBKcQUZ1pgp2vMI4QTjWdoqXMIOdhFBEIeZz0GU/gUs
4SNuoAmbGEM5arCFbbTgHA6wdpq2ArUYx2+04ZHPmBe0hfymS8+UwmvUoR1z
KGK+W8+4gRGUoRrDWNe7ybPT/DYXd+nH8QSLaMRL9kvSrmltziKBZb3Le+b7
ad+iAYOM+2jfoF7exfgv7R89uzwz7PVP52SNx9hn3dpreteU3kXu/ENrJLW5
LXvgMy7rN3qGFdzEGRzjXUcR0Gej+Kp3l5oXMLdH24oYerCAq7iIAPPfda8H
+KXfOKhrPsi9EdYaDeCd586e5g7HWd+rZ7kHv3U1lVre0bUT6NB3WOYf61p5
lkamdVmTDGTTP4hK+p2YwSHrsiHPTtHPsm7uoWZt0nN7SebyrMukZFG+8Sut
QUwzI9l/rmeV/0C+dRmVbN7HN5y0ri8Z/ak1ktpENIsJzYJk8inm/9cSR6w7
o5wtqrWWzMW15pLVpGZLMrsPoqF7Uw==
           "]]}]}, {}, {}, {}, {}, {}}, {{
        Directive[
         RGBColor[0.368417, 0.506779, 0.709798], 
         AbsoluteThickness[1.6]], 
        LineBox[CompressedData["
1:eJwt0stXjGEcB/C5NbdyS1GUhOme5DYqjNwGxdSopqs5x6adlpYt7ezsCP1n
dugiqSSFzxwtPuf7e77vOe/znPd5G5/P5V8EA4HAW0KU5iRHqSPFedJkyJKj
QJFZ5njJPK94zZv9d75jgfd84COLfKLCZmOUM0qSSoqse94sm0iRYITv+m3O
mc/ylDxrup+lc5vjPOOb9TE5zRDDPCbHE6YYYJCHxHjEER4Q5T5lZDnMPSLc
JcwhZli11xnZyGlC3GFF3yBPUU+Q2yzrt0rf2HySfm6xpNvkhLmWDDf5qtug
xnycG1zni+4Hf+kL/r/AaqqYpIdernKNNBNc5grdXOIiBca5wJ/Svcs92SUP
0smudbv8LTvkAdrYsW6Rv2Sr/CwTxIkRpYwI4f1/7R/p8zaB
         "]]}, {
        Directive[
         RGBColor[0.880722, 0.611041, 0.142051], 
         AbsoluteThickness[1.6]], 
        LineBox[CompressedData["
1:eJwl0slfjAEcx/FnZoRoSvZovfgH+geSJcTFlQODSoec3N3duzs4aJG1mmwV
Y8k6SUgTkWWUEJGl9J6Xw/v1+b2+r2cu8zxlsSO7G0JBEJxkv2Mfe8NBcIqP
dJHmEuM84BOXmeAKkzzkC1f5zDW+UhAJgrV8c39nih9Ms84+o7/4yR9+s97+
RAfp4S/dXKCJWeZ4xnMu0sw/Ar8d0he000LIFmbYnaKDViK2Xh3hJa84zQL7
dR3lNW9oo9j+SG+Q5U7oQk3qYr2pi/SWZmu/LtXbukSj5FBIHsvIZTn5FPHU
s2cocd/RATo5ywrbSsbcb4lzjlW2Pn3Hez5wnlL7Y73Lavc9XaP3dQ8bqWQT
m9nCVqrYxnZ2UM1OdlFBORsy75Zo5v/NvE/fTZoUSRLEaeUEjRznGEep5zB1
1FLDIQ5ygFjo//c4D4fQYAA=
         "]]}}}], {
    DisplayFunction -> Identity, AspectRatio -> 1, Axes -> {False, False}, 
     AxesLabel -> {None, None}, AxesOrigin -> {Automatic, Automatic}, 
     DisplayFunction :> Identity, Frame -> {{True, True}, {True, True}}, 
     FrameLabel -> {{
        FormBox[
         StyleBox[
         "\"Assortment Probability \[Rho]\"", 16, StripOnInput -> False], 
         TraditionalForm], None}, {
        FormBox[
         StyleBox[
         "\"Resident Sociality Strategy R\"", 16, StripOnInput -> False], 
         TraditionalForm], None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {
      "ScalingFunctions" -> None, "TransparentPolygonMesh" -> True, 
       "AxesInFront" -> True}, PlotRange -> {{1, 10}, {0, 1}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.02]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
       RowBox[{
         RowBox[{"G", "(", 
           RowBox[{"R", ",", "\[Rho]", ",", 
             FractionBox["1", "2"], ",", 
             FractionBox["3", "4"]}], ")"}], ">", "0"}], 
       RowBox[{
         RowBox[{"G", "(", 
           RowBox[{"R", ",", "\[Rho]", ",", 
             FractionBox["1", "2"], ",", 
             FractionBox["3", "4"]}], ")"}], "<", "0"}]}, "SwatchLegend", 
      DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{
                    Directive[
                    PointSize[0.5], 
                    EdgeForm[
                    Directive[
                    Opacity[1], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1]]], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    Opacity[0.3]], 
                    RectangleBox[{0, 0}, {10, 10}, "RoundingRadius" -> 0]}, 
                    AspectRatio -> Full, ImageSize -> {10, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{
                    Directive[
                    PointSize[0.5], 
                    EdgeForm[
                    Directive[
                    Opacity[1], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1]]], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6], 
                    Opacity[0.3]], 
                    RectangleBox[{0, 0}, {10, 10}, "RoundingRadius" -> 0]}, 
                    AspectRatio -> Full, ImageSize -> {10, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.5}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"SwatchLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"EdgeForm", "[", 
                    RowBox[{"Directive", "[", 
                    RowBox[{
                    RowBox[{"Opacity", "[", "1", "]"}], ",", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False], ",", 
                    RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}], 
                    "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[
                    0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{"Opacity", "[", "0.3`", "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"EdgeForm", "[", 
                    RowBox[{"Directive", "[", 
                    RowBox[{
                    RowBox[{"Opacity", "[", "1", "]"}], ",", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[0.587148, 0.40736066666666665`, 
                    0.09470066666666668], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.880722, 0.611041, 0.142051]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.880722, 0.611041, 0.142051]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.880722, 0.611041, 0.142051], Editable -> False,
                     Selectable -> False], ",", 
                    RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}], 
                    "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[
                    0.587148, 0.40736066666666665`, 0.09470066666666668], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.880722, 0.611041, 0.142051]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.880722, 0.611041, 0.142051]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.880722, 0.611041, 0.142051], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{"Opacity", "[", "0.3`", "]"}]}], "]"}]}], "}"}], 
           ",", 
           RowBox[{"{", 
             RowBox[{
               TagBox[#, HoldForm], ",", 
               TagBox[#2, HoldForm]}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", "Automatic"}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"ed2e478c-4b61-439c-9770-3175a09d179d"]
}, Open  ]],

Cell["\<\



 In second plot, we consider case in which c = 2, so the ESS with no \
assortative interactions (\[Rho] = 0) features fewer interactions than \
experienced by the socially optimal sociality strategy.\
\>", "Text",ExpressionUUID->"7dd2385a-0840-4cc0-a8c2-b1df6e39f213"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"RegionPlot", "[", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{
     RowBox[{
      RowBox[{"G", "[", 
       RowBox[{"R", ",", "\[Rho]", ",", "2", ",", 
        RowBox[{"3", "/", "4"}]}], "]"}], ">", " ", "0"}], " ", ",", " ", 
     RowBox[{
      RowBox[{"G", "[", 
       RowBox[{"R", ",", "\[Rho]", ",", "2", ",", 
        RowBox[{"3", "/", "4"}]}], "]"}], "<", " ", "0"}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"R", ",", "1", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"\[Rho]", ",", "0", ",", "1"}], "}"}], ",", 
   RowBox[{"PlotLegends", "\[Rule]", "\"\<Expressions\>\""}], ",", " ", 
   RowBox[{"FrameLabel", "\[Rule]", 
    RowBox[{"{", " ", 
     RowBox[{
      RowBox[{"Style", "[", 
       RowBox[{"\"\<Resident Sociality Strategy R\>\"", ",", "16"}], "]"}], 
      ",", 
      RowBox[{"Style", "[", 
       RowBox[{"\"\<Assortment Probability \[Rho]\>\"", " ", ",", " ", "16"}],
        "]"}]}], "}"}]}]}], "]"}]], "Input",ExpressionUUID->"bdadc572-9312-\
4071-89c0-ca5f23c91242"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[
    GraphicsComplexBox[CompressedData["
1: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
Z0R0aAflbmPK9tocfsqRFavbucwdlZf/3+gYk72Tcq7WkhNn6qz8aNuhbnZb
F+WBQ2fOcQcEKM8s6n7JbO2qvH3G5f5J2nPK5Y9WLXNYApX908KqWlqeV2Y+
PD8wH8x8MPPBzAczH8x8MPPBzAczH8x8MPPBzAczH55/mA9mPpj5YOaDmQ9m
Ppj5YOaDmQ9mPpj5YOaDmQ/Pb8wHMx/MfDDzwcwHMx/MfDDzwcwHMx/MfDDz
ebw/1zP9Mf0x/TH9Mf0x/TH9Mf0x/TH9Mf0x/bn/0B/TH9Mf0x/TH9Mf0x/T
H9Mf0x/TH9Of+yX9Mf0x/TH9Mf0x/TH9Mf0x/TH9Mf0x/bm/0x/TH9Mf0x/T
H9Mf0x/TH9Mf0x/TH9Of53n6Y/pj+mP6Y/pj+mP6Y/pj+mP6Y/pj+vP7g/6Y
/pj+mP6Y/pj+mP6Y/pj+mP6Y/pj+/F6iP6Y/pj+mP6Y/pj+mP6Y/pj+mP6Y/
pj+/1+mP6Y/pj+mP6Y/pj+mP6Y/pj+mP6Y/pz/4C/TH9Mf0x/TH9Mf0x/TH9
Mf0x/TH9Mf3ZD6E/pj+mP6Y/pj+mP6Y/pj+mP6Y/pj+mP/s39Mf0x/TH9Mf0
x/TH9Mf0x/TH9Mf0x/Rnv4n+mP6Y/pj+mP6Y/pj+mP6Y/pj+mP6Y/uyP0R/T
H9Mf0x/TH9Mf0x/TH9Mf0x/TH9Of/Tz6Y/pj+mP6Y/pj+mP6Y/pj+mP6Y/o/
3pfff/TF9MX0xfTF9MX0xfTF9MX0xfTF9OX3MX0xfTF9MX0xfTF9MX0xfTF9
MX0x+4+Pv79hfwmzP4TZ38Hsz2D2XzD7K5j9k/z3/nu7w+Kr9jsx+xX48b48
32OelzHPn5jnOczzEeZ5A7N+k8/fl/2JGWlybXToGTE0963COJOvjFqcPUVz
NajPs5/K70Gs3l/9up+q3q/+asbZT2Uc04f9VK5vzPuMsHnFdQEFN9Tx7Kdy
POb4f/TdGRma5FLHs5/K8Zjjt15OPB5nqlLHs5/K8Zhx9lPV78lfzTj7qYxj
vu+c2ooZdts5ZYNtZDedrkjZMdZvocl+Xvm9B9cbwqMvKnfefmBCklasnPvH
BSdsjhI1n9l9Zh2xuD3viwJLh79gt1Uqn5tvWOIMv6n+3q/8GLTW5mhU9h64
9IzZekuZ85U8zlfM+Yo5XzHnK/8/zj/OD36fczzvO/k+ub74PjHz4f0Yx3O/
JY/3pRzP+zXyH3//xftOxtnfYZz3n4yzX8I470Ppw/Mnffj7MM7zHeP8vRjn
+Ylx/n6M83zCOO8HGWf9Z5z3hYyzvjLO+0PGud9h7iccz/f55H3gk/eBT94H
Pnkf+OR94JP3gU/eB/7/vw/8J7qqYFw=
     "], {{{
        EdgeForm[], 
        Directive[
         RGBColor[0.368417, 0.506779, 0.709798], 
         AbsoluteThickness[1.6], 
         Opacity[0.3]], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1: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
OsLjeNsQcyPJn0Oq3/8DNJbsWA==
           "]], 
          PolygonBox[CompressedData["
1:eJwtkmtPyGEYh++n5SxWY1GU1MSkIUshcp5qXuQb+AB8Gm8dltPmlEOpEM3M
MBlWDlNJvVBOlbM0rt/u+8W153r+/+d0H4oOHm48lGFmWyAT9iezQriN98Fq
vAzu4WVagw8zXoTr8AFm8K2NsQWm49OgJNYsw2fDMfMzy/E1sMH8zI34D8Yn
8BiymedAM94EC/CFcBk/GXd9ZGw1v3Mt83Vw3/zMoXij3nYBxmAErsJNmIg3
662dkMvaRXAFPwUV+Prk+dCZhm+GZ+iA7sC/MT6CB/APqvjWzdgPX+INuvuG
tvNvK/Tib2EWPhOORAzL8blwHL8D2/GpeIti1r8s6DBfsw+vgzfmZ+zFl8JZ
/DXsxvPhDP4qYt+V3JWDVfjK5LW8C6OwJ/nea/AOipl3MZ6H97CD+UvzHNXg
fxhfQI/6JnmMiu05VCfP2UDUtDJ5jvojZ43MD8DD6LkGvB6Omse0E18Mp83v
nIfPT57LE7ACL03+dvWY1uYlr632fI0aqTa6oxb/G72jntrGfDJ665J5LBnJ
XTGpV+dAu3nPfo8eVW+qxpvwXxHrU/gZ3+TqkUEoSl7Lc/A7cqZcqQdUmyVw
y7xGJcljVGzK+eeogXKvmn+KM3WW3qRaFyTvXdV8PGqo2unM/5/IhBU=
           "]]}]}, {
        EdgeForm[], 
        Directive[
         RGBColor[0.880722, 0.611041, 0.142051], 
         AbsoluteThickness[1.6], 
         Opacity[0.3]], 
        GraphicsGroupBox[{
          PolygonBox[CompressedData["
1:eJxNmXnclmMWx9/neiRbg2GIkbFky9AwjX0wzIwZxphhmKyjkqJViySlVaW0
vZW027UIEbJESAppskypKLtGiywlkvP9XN/787x/nM597utc5/e71vv3vB3Y
tN35bVNVVVXL+Kccvnf4LmH/DmtZqqq6JOzSsP9EfHH4q8PaEIddGdailN+T
1zrsCtuuDbss7PKwa6xB3NZ+TcLa6ZuGdTGPfteFNQu7Kqy97cRdw1qJ0yRl
Lh3DOsmrhe2Xy+P6Uh4DdTvbTjw0rHdYn7AbxKTfkLBetvUQGy43yRu+fa0L
3+6+a2+tzrb1qsGrWcrPPcP62Q/MW/SM6Tbb6Tcg7MawbmH9bS/iNvIYaAyv
W/XdzWtt3tkp1xwcNsj2Ho6tk1yHyZsxPRg2OezOsBFyheMd1oBjte/gNVIP
39FygsvtejBH2U4bm6xW2O5hY63HfI93PeAyQT88bJzttE2SU7Ucq8W/Uw/O
OSnzHBN2t5zgcpfto63b17H9LeXce8Luc5zwmiqPiWEPyAOOD1mL2lN8R94M
edA2Xa5wnGYN4nNTxnk47BEx7w170jz6PSqP+8Nm2l7EY+XxmDG8ZumnmDvG
MTzhGKj7uO1T5TLceZwtJmv+tGNgfM+JDZdna/B9ybrwneM78l4Ug7a58oPX
89Ygnmc/MF/WPxX2unn0Oy/m55nwr4TNtx1eb4S9IM6CUs6B10L9HNtnyeM1
x0DdV20n/nvKY6H/YusxppXG/w1bIlc4vqmHyz9S5vUWa5kyj7fD3pETXP6n
B3OpHi7L9Iz1Xf2isOV6xrdCX/B4SR7v1eD1vh5eg4PDgLB/hn0oD/A/qMGr
f8rPq53LB13jj8yFYzlyvg2/KexzeTAfn8oVjuutC85nviNvnbVp+79c4bjG
GsQb7Afml/qPS/k7szb8d2FfhX0i5kbbib8XA/yvbQf/Gz18m6fMYa1jWCOX
b21fY61ljmeLuevEWWpbVco8wPlRrnDZPmWO9NvmO/Ja+Z67LKXMCcxSyjWI
a6fcj3HskLL/IWxX+zD3O4VtFXPHlNu3ahvksXPK7eDvkrKvMne9eT9LGZu6
dVJuJ37H+WeNfu7dy5j2TJkfvPaWBzi/8B1c2ntP1wvby3fk/TJlPMaxT8qc
wKxrDeL97Qvmr/R7hB1qn33DDpQHmAfYTtxBzCPCDrId/IP1e9u/jjwOEZu6
9W0nPjXs2LDfhh1mH7j/PuwY246WBzi/lusB9jnUfkf57kD7HGLbb+QEZkNr
EJ8v90Zhv/O5Qdgp9gH7+LAjxTzO9iO1/eVxgu3gn6g/2tx65p0sNnVPsr2h
GPXleoFcTktZ36Al0Bx/kB/4f5Efc3OG7+B4ph4uf5IHOH/Wg/9H2090Ddlf
7K2/Wo91QBuiu9BnaMSWxlemrCmbl7IuRIOh09BurYzRcK2NzxITruhHdFCh
Q9uYd3qNuS/0JXloR3Rce/HRaJ3lhBbqaA001Y3y62xba991lRPzV2jVLtYC
4yb7g9ndmHa0BprjqpS14M3y6GFe05S1bAd5oAF7it3buKl92olHvUJv9jGv
0JT95NrfGO4DjAu9OFDsQcbgoccGizfEmLpDjcEZZgz+cGPwRhiDV21caMRq
8UcZk4cWmVCq6MXRYqNfxog91rjQhYVOxBfacJx5A60xSuxJYqDD+PZNL1X0
4mTz7jKm393GYKOl7hH7PmMw7jcG8wFjuEwxhuNUY7CnGU8Sf1qpol8niT1D
fmA/ZAw2+uphMdBQhTbEF9pwpnndHP+AUkUXPiY2uuxxMdABs+XxpG3UQys9
J8fZts303Rx5oLWekd/T1gJjrv3BfMG40GcLxEDPFDrxRfOojS56Vbx55hUa
cZ5jm1MDm3qviD3fvDnWWCiP1607RbxZ1kVHLRYbrbVILouNwVtiHjh8O98u
VbQdMdrvLTkUGnGJeXxjV5cq+o8+aDR02KpSRfMVGhC/zPla5LtCCy6X10rj
QkcuLVW0YKEN3zOP39bcRy2tN9exPhv4pfhR3y381Slrpi/ER1N9Im800Vpx
ePexPD4zDxy0FZqK35X9Ur4zGPd6+6O50EGFRsOjh9ql/Ntvt1TRgoU23GD/
a1LWhZvF3mjeCusWPKhXaMavzEPXoDHQHCvl+LnjQYOh1VqnrNu2S7kummqr
bXyzqAEPdNX31t1mHmNCr6GvNtjvB2vX9puH3kKPFPoLv4t9drWNPuioQg/u
4LdynZhbrI3OIo9xbBK/0H+FHsSTxxyAt81x7OFcHKwuaCgeOqrQfXuax3fy
dLUB/NBH+1oXHbWXeHWNd/Qdta5LWSPulyo6D02CDjtU7QEOuqnQdweYt7u5
9ax1kHmFzjvIudtH7LrWK/Rd/VTRXsc4zjpyp0/HlHXk4XJBzx0rBhoJLXWE
GqGRnNBaR4rd0LxD7HeM3I8yDw12nP1pQ+cU+g5/smNrIA590EiF7jve/vsb
N0gVnXeC4zhM7g2tV+i7k8zjHLDnquR4qjw4c+w52i5LWY82sg8aDr12S8rn
92zxeHem+VfYp9B/Z1gXPYdOvCjlv7Pwnbw05d/G3ImXpPwbnrtxSPjbUtZ2
/A2Rv7PwTbve/sSdwi601g3mnZsq+hKuF6f8u527v7HtfIsmhp/gGjM3Z9ln
UNit8qdfY/PPEQt90Sd8V9tuDusR9q+wXmGda/C7yDH2DH+5/fs6P8zTBfpG
9ic+zbyzxepeI5d5usT5Oc+xMa5zHTvzc4pzzHj4jX+pc3uhHKjL3KKbG5dy
vy41+HZ2Poc692jb4SlrS3Rli5S/Adz/w8yjjWc0KDp8RMp90KmjUv5ecI+O
NuaOHpPyfcpd3cZn7lXOA78ruFOuTflOJ+d2+3HXjpTDKmteI59+YvJNuSPl
u7qWWLcbww0N3cE61fIbm3KfttbrZk1wbhTrVvfLEe4d7i7O6PiU77LdHMdN
cm7sPmF92G/cKdx18OT8oOGbGfPMeT7D8Y+Ty+5ya+f8sOd7ukfYMz3cG+Pt
Ayf2TF/3Deeit/uDs9PLdUZbfOT389WIV7snvgt73r3F3KA9+Lb/EH5uyvtv
W9gL7i3marRrM8pn5q2lc765VGljD7TyPev4dPgfU/4bVHNzijkf6btqn1e5
B8ZYs4NrUE8/0bldGbbC9Xg/7D3nfVbYNymfaTCfEndj2JfO01dhX7tmm8Me
T/mcLQ971zXAb1fOz7PDvk/5XD5hn/N896TvOUOckebqB/i3cp3Gub7kcNdd
7H04WG5ov4E+0865beye4XxxHpv4zH7m/HEOm7iWQ6w90FrMIXufM9BMXsPk
1sSY8z7O/cR+vtO+3CED5PaW54t9uZ3zwnNbbZx9i/Vb7brfYX5bn2u5TuOd
D+5czhjnq4PPh+sH+dzfmqu8l0Y4dvbsppT3bTnWZ4pYk1PW3Ojr6eEftc6L
Ke8/5nZd2PqU78FpYTNT3ksPhr1i/tSwR2rMyWS5zAu7J+Xz+0b4j1Oe4wVh
C1O+6/ktAAfubfbiRMe3Z/Dco5y/Jx+E3eVafBT+bse1LPzSlO/IOWGpnO+X
Z8L4jzbupncYX8r35Wspn2fWf1HY6ynvi1Vhu5bz/vk8ntekfNe/GbYk5Xv9
s7BPU75j6PehfRenPLarnMvJ7gHWbIJzNdl54T3cH5I/Z+6xlM9d7XKe3/2c
s4edt1rlPL/M7VK1O3fTyxHPT/m7xZnevpz3C/fQlpTvIu6hrSmfm3tdD2r2
lxPrzh2wQznP/dqwL1K+C5nvGc75LtFep5zv053D71TO9yjrP909MMAxUvsn
APvJRQ==
           "]], 
          PolygonBox[CompressedData["
1:eJwt00lPVEEQwPH3ugcBBTNsyoELNz6DHwEYGccLYCRmghCIMmEVFRgXYjLh
czDqwQ0XwAAeNBiJMYIoEkJQFFQcBJewBQP/Stfhl+ru92Zed1V1cTQWaTKe
5x1DAD+ZrKID5VjGd7ShDP8xjDBO4QUKref1ESPYxGMcRxU+YgbncB7r+INO
hPAe02hAI3YwiApUYwqTqEM9MvnWIXQzPolnOML8BrEURxk/J55AAhvIZ+06
sRIDmEczivS/R3BJv3Ebs7rXAF7qN+S/T+MLFnHW97wo8S5e44yufSZ+km/5
bu0m3uneU6xNaM4kVzUoYG+vdNyLJXxFC+/WEm/hg+Zmi7X7xLfGPYszP8Dv
0xDUM2UwTrfubK14gDnEjHsnwDNr3dlk7SEW9N0S3MMb484me1jRHpDatyOH
3/7Q8VU8xZ72guQ8yPNxzdUV5DL/RbyAa8hj/pd40bia/NOeCOnaEHa19mHt
nTF0aQ/51uVUcnmZ+ATbxvWa9IzH86TUwHc1ld4aNe5d6bGk9khC33mkPSK9
IT27ZtwdKNc9Z1vXc9JrPTjMOMu6cRzf9MxyVrkjKc2R5Ebu0G/NgZxdet5Y
V1OppZzpoHU9ILWXnpZe7tfaSk/L3bqjtZE7tg8gGnse
           
           "]]}]}, {}, {}, {}, {}, {}}, {{
        Directive[
         RGBColor[0.368417, 0.506779, 0.709798], 
         AbsoluteThickness[1.6]], 
        LineBox[CompressedData["
1:eJwt0jlTk0EcwOGEmBAE8YIgR5CoERVQEFBE8EACgieHUtEwQ4lWlpSUttz6
AfxOFggi4MElcqjI844Uz/z+u5PJzuy+qaHXva/CoVBoliyCOc5xEiRJU0Mj
rWR4wgsGGWaEN4wyxlvGmWCSKaaZOTzrHe+D/3HgIx7zkG666CdODhEG+Ob3
2fpVNyg3J+mkgxV765SZS8nQzrK9NUrMxTygjSV7Z7SIBH+t7+sXLdQCTvPH
+p4u6ik9yQl+W9/Vz/pSs9gL7kh39Y6GaWHHulm39Xb4/0Xf4pfxpm5pk/7T
G/pTG3QzuHfto5fr1HONOmrpoYarXKGaKp5zicukqeQiz4gSYz94R13QIzqv
q8H7m/O5wHk+2fvBMXMe50gxZ+87ueajVHCWp3y0/yF4M2JEgzOIHH5rB/cN
OuM=
         "]]}, {
        Directive[
         RGBColor[0.880722, 0.611041, 0.142051], 
         AbsoluteThickness[1.6]], 
        LineBox[CompressedData["
1:eJwl0llTzWEcB/D/6VhCnJRtpquuegHuiVK6NS5CyMk14w3kBRjX3VfHUnEK
ZWlBRUhZjqUUUbQ4liwhLfqccfGZ7+/3fWaemf9/ntzo8T3HQkEQxDidFgSl
lkg4CN6a39HLQy5SzShj9NFPnBre84FHPKaRWu4QY5M7b8oe7pJpn5CTjPOR
KdbrP8nPJPnKF7L03+R3pvnJD7L1G/hlvsIMzfzmFrO08Ier/OU281xjjuss
0Mk/brBIK11sdv8ZGcg2+YSnJDhLSN8un/GcF5wjTd8hXzLAIOcJ65fxyjxE
E3Us161g2PyaS9SzUpfOG/MIl2ngHhfY4qxbPuA+G+2rWcMq1pLBOk4638t2
8tnBTgooZBdFFLObEraxlTxyiKS+IfWPvZUkIyTooZU4NVRxikpOcJQKohyh
nMMc4iBlHGA/+0L/3+MSTopkOw==
         "]]}}}], {
    DisplayFunction -> Identity, AspectRatio -> 1, Axes -> {False, False}, 
     AxesLabel -> {None, None}, AxesOrigin -> {Automatic, Automatic}, 
     DisplayFunction :> Identity, Frame -> {{True, True}, {True, True}}, 
     FrameLabel -> {{
        FormBox[
         StyleBox[
         "\"Assortment Probability \[Rho]\"", 16, StripOnInput -> False], 
         TraditionalForm], None}, {
        FormBox[
         StyleBox[
         "\"Resident Sociality Strategy R\"", 16, StripOnInput -> False], 
         TraditionalForm], None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], 
     Method -> {
      "ScalingFunctions" -> None, "TransparentPolygonMesh" -> True, 
       "AxesInFront" -> True}, PlotRange -> {{1, 8}, {0, 1}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.02], 
        Scaled[0.02]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
       RowBox[{
         RowBox[{"G", "(", 
           RowBox[{"R", ",", "\[Rho]", ",", "2", ",", 
             FractionBox["3", "4"]}], ")"}], ">", "0"}], 
       RowBox[{
         RowBox[{"G", "(", 
           RowBox[{"R", ",", "\[Rho]", ",", "2", ",", 
             FractionBox["3", "4"]}], ")"}], "<", "0"}]}, "SwatchLegend", 
      DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{
                    Directive[
                    PointSize[0.5], 
                    EdgeForm[
                    Directive[
                    Opacity[1], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1]]], 
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    AbsoluteThickness[1.6], 
                    Opacity[0.3]], 
                    RectangleBox[{0, 0}, {10, 10}, "RoundingRadius" -> 0]}, 
                    AspectRatio -> Full, ImageSize -> {10, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{
                    Directive[
                    PointSize[0.5], 
                    EdgeForm[
                    Directive[
                    Opacity[1], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1]]], 
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    AbsoluteThickness[1.6], 
                    Opacity[0.3]], 
                    RectangleBox[{0, 0}, {10, 10}, "RoundingRadius" -> 0]}, 
                    AspectRatio -> Full, ImageSize -> {10, 10}, 
                    PlotRangePadding -> None, ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.5}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"SwatchLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"EdgeForm", "[", 
                    RowBox[{"Directive", "[", 
                    RowBox[{
                    RowBox[{"Opacity", "[", "1", "]"}], ",", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False], ",", 
                    RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}], 
                    "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.368417, 0.506779, 0.709798], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[
                    0.24561133333333335`, 0.3378526666666667, 
                    0.4731986666666667], FrameTicks -> None, PlotRangePadding -> 
                    None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.368417, 0.506779, 0.709798]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.368417, 0.506779, 0.709798]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.368417, 0.506779, 0.709798], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{"Opacity", "[", "0.3`", "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"EdgeForm", "[", 
                    RowBox[{"Directive", "[", 
                    RowBox[{
                    RowBox[{"Opacity", "[", "1", "]"}], ",", 
                    InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[0.587148, 0.40736066666666665`, 
                    0.09470066666666668], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.880722, 0.611041, 0.142051]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.880722, 0.611041, 0.142051]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.880722, 0.611041, 0.142051], Editable -> False,
                     Selectable -> False], ",", 
                    RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}]}], "]"}], 
                    "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[0.880722, 0.611041, 0.142051], 
                    RectangleBox[{0, -1}, {2, 1}]}}, DefaultBaseStyle -> 
                    "ColorSwatchGraphics", AspectRatio -> 1, Frame -> True, 
                    FrameStyle -> 
                    RGBColor[
                    0.587148, 0.40736066666666665`, 0.09470066666666668], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], 
                    "RGBColor[0.880722, 0.611041, 0.142051]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[0.880722, 0.611041, 0.142051]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[0.880722, 0.611041, 0.142051], Editable -> False,
                     Selectable -> False], ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{"Opacity", "[", "0.3`", "]"}]}], "]"}]}], "}"}], 
           ",", 
           RowBox[{"{", 
             RowBox[{
               TagBox[#, HoldForm], ",", 
               TagBox[#2, HoldForm]}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", "Automatic"}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output",ExpressionU\
UID->"86d1ff4f-ce13-4579-ae62-5c27b5efa186"]
}, Open  ]],

Cell[BoxData[""], "Input",ExpressionUUID->"1cc38a31-ec2d-4eca-9102-afcad52d8337"],

Cell[BoxData[""], "Input",ExpressionUUID->"13e42059-c4fc-4569-9d0d-02a92853e716"]
},
WindowSize->{808, 688},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
PrintingCopies->1,
PrintingPageRange->{1, Automatic},
ShowCellBracket->Automatic,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"11.2 for Mac OS X x86 (32-bit, 64-bit Kernel) (September \
10, 2017)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1488, 33, 412, 7, 104, "Text",ExpressionUUID->"7a3bb90e-6b81-41a3-9b83-31d710265e30"],
Cell[1903, 42, 514, 7, 104, "Text",ExpressionUUID->"b5115b27-8ca8-4008-9353-ff6fe3a2e98a"],
Cell[2420, 51, 1111, 31, 97, "Input",ExpressionUUID->"cfb45224-a736-46ae-882d-6ddddf085689"],
Cell[3534, 84, 208, 3, 58, "Text",ExpressionUUID->"f803ee86-636d-445b-beaa-0ee6ac6f59dd"],
Cell[3745, 89, 705, 20, 30, "Input",ExpressionUUID->"fbf09981-720a-4f02-9c6d-aa0e236a9274"],
Cell[4453, 111, 279, 4, 58, "Text",ExpressionUUID->"fb1e440b-ca8a-4614-bfa8-5717fbb3b55f"],
Cell[CellGroupData[{
Cell[4757, 119, 262, 7, 30, "Input",ExpressionUUID->"b5d1d844-5bdb-42c2-814e-31b32a1d7776"],
Cell[5022, 128, 10248, 258, 520, "Output",ExpressionUUID->"6768e8df-99c6-45fd-ae25-64b5c0d4a672"]
}, Open  ]],
Cell[15285, 389, 81, 0, 30, "Input",ExpressionUUID->"8e7f0d22-f3f6-406e-a839-071ed5193969"],
Cell[15369, 391, 456, 6, 104, "Text",ExpressionUUID->"7e2b3646-c3f9-478f-b009-edbf3cfb7f62"],
Cell[CellGroupData[{
Cell[15850, 401, 377, 11, 30, "Input",ExpressionUUID->"92444f04-d049-4452-8108-2ce986e7909f"],
Cell[16230, 414, 1382, 48, 73, "Output",ExpressionUUID->"cf0fc4ef-19b0-4539-b302-12a471154311"]
}, Open  ]],
Cell[17627, 465, 81, 0, 30, "Input",ExpressionUUID->"cef55120-e829-447b-b749-3ff0626620ff"],
Cell[17711, 467, 569, 8, 127, "Text",ExpressionUUID->"0c85a68a-e3f6-43da-8fc2-377e4dbc30d8"],
Cell[CellGroupData[{
Cell[18305, 479, 1878, 61, 133, "Input",ExpressionUUID->"34940c44-c680-4b15-a7a2-360c4dd6d741"],
Cell[20186, 542, 477, 16, 59, "Output",ExpressionUUID->"be2e3769-8f07-4e47-98a9-163679999e19"]
}, Open  ]],
Cell[20678, 561, 89, 0, 30, "Text",ExpressionUUID->"2b9632b3-f360-4f0d-af96-cf2eaa79e9c1"],
Cell[20770, 563, 231, 3, 58, "Text",ExpressionUUID->"a896bb13-e3d4-4b43-bb97-7d410b2f9532"],
Cell[CellGroupData[{
Cell[21026, 570, 525, 17, 56, "Input",ExpressionUUID->"e5ccd473-2521-4a36-b6df-50e19f146394"],
Cell[21554, 589, 644, 17, 55, "Output",ExpressionUUID->"1e883462-a177-4e65-8142-ab2c55e55a55"]
}, Open  ]],
Cell[22213, 609, 81, 0, 30, "Input",ExpressionUUID->"661b6c07-9899-43c2-8a42-54e7eaa616c3"],
Cell[22297, 611, 81, 0, 30, "Input",ExpressionUUID->"3446029a-34e9-438e-866e-9feaf07860ea"],
Cell[CellGroupData[{
Cell[22403, 615, 776, 22, 33, "Input",ExpressionUUID->"975c297a-e39a-4e28-a211-f22b5dd499a4"],
Cell[23182, 639, 694, 21, 55, "Output",ExpressionUUID->"68d6b8b5-a745-434c-a117-19415bb4da9c"]
}, Open  ]],
Cell[23891, 663, 81, 0, 30, "Input",ExpressionUUID->"1c3d6696-e525-456c-87d6-2dc9c02643ae"],
Cell[23975, 665, 81, 0, 30, "Input",ExpressionUUID->"77f50ea4-1b85-4b0d-9b1e-8601b783359d"],
Cell[24059, 667, 81, 0, 30, "Input",ExpressionUUID->"86b492dc-0419-4a91-b01b-b617d9aa2bcc"],
Cell[24143, 669, 81, 0, 30, "Input",ExpressionUUID->"25eb90b2-ccfd-4d8a-8def-f4f92761b919"],
Cell[24227, 671, 398, 6, 81, "Text",ExpressionUUID->"c5036a1c-8f40-4a93-817d-2e0118c0e4ae"],
Cell[CellGroupData[{
Cell[24650, 681, 610, 20, 56, "Input",ExpressionUUID->"72e66b61-5c50-41ed-957f-6bea97de478b"],
Cell[25263, 703, 2150, 61, 93, "Output",ExpressionUUID->"e67c251c-b5da-40f9-9b9a-0880c38c906f"]
}, Open  ]],
Cell[27428, 767, 186, 3, 115, "Input",ExpressionUUID->"f1549858-5c7c-43f8-beb4-f6aa72bce2b2"],
Cell[27617, 772, 228, 3, 58, "Text",ExpressionUUID->"c0b2e75a-8a74-401c-bbf0-7fe4778bd104"],
Cell[27848, 777, 1643, 55, 94, "Input",ExpressionUUID->"88372109-89de-44b7-bfa1-46e39e994271"],
Cell[29494, 834, 577, 11, 196, "Text",ExpressionUUID->"d69b0a87-1627-46f6-8019-f1560463d1c8"],
Cell[CellGroupData[{
Cell[30096, 849, 1089, 29, 94, "Input",ExpressionUUID->"e5812543-05aa-4439-97d6-618e0a3a6bd1"],
Cell[31188, 880, 30304, 571, 378, "Output",ExpressionUUID->"ed2e478c-4b61-439c-9770-3175a09d179d"]
}, Open  ]],
Cell[61507, 1454, 281, 7, 127, "Text",ExpressionUUID->"7dd2385a-0840-4cc0-a8c2-b1df6e39f213"],
Cell[CellGroupData[{
Cell[61813, 1465, 1030, 27, 94, "Input",ExpressionUUID->"bdadc572-9312-4071-89c0-ca5f23c91242"],
Cell[62846, 1494, 29991, 566, 378, "Output",ExpressionUUID->"86d1ff4f-ce13-4579-ae62-5c27b5efa186"]
}, Open  ]],
Cell[92852, 2063, 81, 0, 30, "Input",ExpressionUUID->"1cc38a31-ec2d-4eca-9102-afcad52d8337"],
Cell[92936, 2065, 81, 0, 30, "Input",ExpressionUUID->"13e42059-c4fc-4569-9d0d-02a92853e716"]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature jupuCrPalUm46B1wyjv0oqqS *)
