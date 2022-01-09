importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js');


 const firebaseConfig = {
   apiKey: "AIzaSyCplhW0Z0eU580Hl1H8SXsAQENy__N7WcQ",
   authDomain: "fir-analyticsexample-56665.firebaseapp.com",
   projectId: "fir-analyticsexample-56665",
   storageBucket: "fir-analyticsexample-56665.appspot.com",
   messagingSenderId: "652939399653",
   appId: "1:652939399653:web:93b203a3f93d4fa1131f0c",
   measurementId: "G-50SKDR5EJS"
 };

  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();

  /*messaging.onMessage((payload) =>
  console.log('Message received. ', payload);*/
  /*messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
      body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });*/

messaging.setBackgroundMessageHandler(function (payload) {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);
    // Customize notification here
    const notificationTitle = 'Background Message Title';
    const notificationOptions = {
        body: 'Background Message body.',
        icon: '/firebase-logo.png'
    };

    return self.registration.showNotification(notificationTitle,
        notificationOptions);
});