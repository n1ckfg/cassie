@echo off

cd %~dp0
cd Assets\Plugins
powershell Expand-Archive MathNet.Numerics.MKL.zip -DestinationPath .

@pause

