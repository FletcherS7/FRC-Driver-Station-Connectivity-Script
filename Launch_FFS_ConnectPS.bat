@echo off
rem Created by Fletcher Salesky
rem FFS Connect Powershell Launcher (This verson from 2024-10-19)
rem Launcher for a PowerShell script that performs the most common fixes for Driver Station communication issues to the FIRST Robotics Competition Field Managment System Field Network.
rem Learn more about this script, get updates, and contribute at https://driverstation.app 

rem FRC FMS Station Connect to The Field
Title FFS Connect to The Field
rem fancy color
color 06
cls
rem Launch Powershell Script
if exist "%~dp0FFS_Connect.ps1" (Powershell -noprofile -executionpolicy bypass -file %~dp0FFS_Connect.ps1)
pause