@echo off
rem Created by Fletcher Salesky
rem FFS Connect Powershell Launcher (This verson from 2021-10-06)

Title FFS Connect to The Field
rem fancy color
color 06
cls
rem Launch Powershell Script
if exist "%~dp0FFS_Connect.ps1" (Powershell -noprofile -executionpolicy bypass -file %~dp0FFS_Connect.ps1)
pause