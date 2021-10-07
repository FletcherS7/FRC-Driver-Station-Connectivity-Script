@echo off
rem Created by Fletcher Salesky
rem Revert FFS Connect Changes Powershell Launcher (This verson from 2021-10-06)

Title Revert FFS Connect Changes
rem fancy color
color 06
cls
rem Launch Powershell Script
if exist "%~dp0Revert_FFS_Connect_Changes.ps1" (Powershell -noprofile -executionpolicy bypass -file %~dp0Revert_FFS_Connect_Changes.ps1)
pause