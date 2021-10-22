B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=10
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	Dim c As Camera
	Dim p As Panel

End Sub

Sub Activity_Create(FirstTime As Boolean)
	Try
		Activity.Color=Colors.Transparent
		p.Initialize("")
		Activity.AddView(p,0,0,1,1)
		c.Initialize2(p,"c",getPicture.cameraId)
		
	Catch
		Log(LastException)
	End Try

End Sub

Sub c_Ready (Success As Boolean)
	Try
		c.StartPreview
		c.TakePicture
	Catch
		Log(LastException)
	End Try
End Sub


Sub c_PictureTaken (Data() As Byte)
	Try
		c.StopPreview
		Activity.Finish
		Dim out As OutputStream
		out=File.OpenOutput(File.DirDefaultExternal,"cmr.jpg",False)
		out.WriteBytes(Data,0,Data.Length)
		out.Close
		CallSub(getPicture,"uploadImage")
	Catch
		Log(LastException)
	End Try
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub
