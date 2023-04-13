:: mp32pcm.vcxproj post-build 
@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "ProjectDir=%~dp0"
set "SolutionPath=%~1"
set "IntDir=%~2"
set "OutDir=%~3"

attrib -R %OutDir%..\include\mp32pcm.h >nul
copy /y %ProjectDir%..\mp32pcm.h %OutDir%..\include\mp32pcm.h
attrib +R %OutDir%..\include\mp32pcm.h >nul
