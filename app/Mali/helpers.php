<?php
//use Curl;

function responseJson($status ,$msg,$data=null)
{
    $response =[
    'status'     => $status,
    'message'   => $msg,
    'data'      => $data
    ];
    return response()->json($response);
}

function smsMisr($to,$message)
{
    $to = '2' . $to;
    $to = (int)$to;
    $url='https://smsmisr.com/api/webapi/?';
    $push_payload= array(
        'username'  =>'WKBN6KGK',
        'pasword'   =>'J8DRJwFWf1',
        'language'  =>'1',
        'sender'    =>"The Truth",
        'mobile'    =>$to,
        'message'   =>$message,  
    );

                                //method one error 8001
    $rest = curl_init();
        // curl_setopt($rest, CURLOPT_URL, $url.http_build_query($push_payload));
        curl_setopt($rest, CURLOPT_URL, $url);
        curl_setopt($rest, CURLOPT_POST, true);
        curl_setopt($rest, CURLOPT_POSTFIELDS,http_build_query($push_payload));
        curl_setopt($rest, CURLOPT_SSL_VERIFYPEER, true);  //disable ssl .. never do it online
        curl_setopt($rest, CURLOPT_HTTPHEADER,
            array(
                "Content-Type" => "application/x-www-form-urlencoded"
            ));
        curl_setopt($rest, CURLOPT_RETURNTRANSFER, true); // to read output.
        $response = curl_exec($rest);
        curl_close($rest);
        //dd($response);

                                //method two error 8001
    // // Create a new cURL resource with URL to POST
    // $ch = curl_init($url);
    // // We set parameter CURLOPT_RETURNTRANSFER to read output
    // curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    // // Let's pass POST data
    // curl_setopt($ch, CURLOPT_POSTFIELDS, $push_payload);
    // // We execute our request, and get output in a $response variable
    // $response = curl_exec($ch);
    // // Close the connection
    // curl_close($ch);
    //     //return $response;
    //     //return responseJson(1,'success sending sms ' ,$response);


}

/**
 * @param $title
 * @param $body
 * @param $tokens
 * @param array $data
 * @param string $type
 * @param bool $is_notification
 * @return mixed
 */
function notifyByFirebase($title, $body, $tokens, $data = [], $is_notification = true)
{
    // https://gist.github.com/rolinger/d6500d65128db95f004041c2b636753a
    // API access key from Google FCM App Console
        // env('FCM_API_ACCESS_KEY'));
    
    //    $singleID = 'eEvFbrtfRMA:APA91bFoT2XFPeM5bLQdsa8-HpVbOIllzgITD8gL9wohZBg9U.............mNYTUewd8pjBtoywd';
    //    $registrationIDs = array(
    //        'eEvFbrtfRMA:APA91bFoT2XFPeM5bLQdsa8-HpVbOIllzgITD8gL9wohZBg9U.............mNYTUewd8pjBtoywd',
    //        'eEvFbrtfRMA:APA91bFoT2XFPeM5bLQdsa8-HpVbOIllzgITD8gL9wohZBg9U.............mNYTUewd8pjBtoywd',
    //        'eEvFbrtfRMA:APA91bFoT2XFPeM5bLQdsa8-HpVbOIllzgITD8gL9wohZBg9U.............mNYTUewd8pjBtoywd'
    //    );
    $registrationIDs = $tokens;
    
    // prep the bundle
    // to see all the options for FCM to/notification payload:
    // https://firebase.google.com/docs/cloud-messaging/http-server-ref#notification-payload-support
    
    // 'vibrate' available in GCM, but not in FCM
    $fcmMsg = array(
        'body' => $body,
        'title' => $title,
        'sound' => "default",
        'color' => "#203E78"
    );
    // I haven't figured 'color' out yet.
    // On one phone 'color' was the background color behind the actual app icon.  (ie Samsung Galaxy S5)
    // On another phone, it was the color of the app icon. (ie: LG K20 Plush)
    
    // 'to' => $singleID ;      // expecting a single ID
    // 'registration_ids' => $registrationIDs ;     // expects an array of ids
    // 'priority' => 'high' ; // options are normal and high, if not set, defaults to high.
    $fcmFields = array(
        'registration_ids' => $registrationIDs,
        'priority' => 'high',
        'data' => $data
    );
    if ($is_notification)
    {
        $fcmFields['notification'] = $fcmMsg;
    }
 
    $headers = array(
        'Authorization: key=' . env('FIREBASE_API_ACCESS_KEY'),
        'Content-Type: application/json'
    );
//  dd($headers);
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmFields));
    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}