var global = ("global",eval)("this");
global['_bpush_env'] = {
  endpoint_base: "https://bpush.net",
  app_key: "f43f0ba4-03b1-48c4-945f-0cf4bfdcea7e"
};

self.addEventListener("install",function(a){});self.addEventListener("message",function(a){});
self.addEventListener("push",function(a){var b=_bpush_env.endpoint_base+"/sapi/v1/get_notification";a.waitUntil(self.registration.pushManager.getSubscription().then(function(a){var c=a.subscriptionId;return fetch(b+"?"+("app_key="+_bpush_env.app_key+"&sid="+c)).then(function(a){if(200!==a.status)throw Error();return a.json().then(function(a){if(a.error||!a.notification)throw Error();a=a.notification;return self.registration.showNotification(a.subject,{body:a.body,tag:a.tag,icon:a.icon+"?nid="+a.id+
"&sid="+c})})})}))});
self.addEventListener("notificationclick",function(a){a.notification.close();if("user_visible_auto_notification"!=a.notification.tag){var b=a.notification.icon.split("?")[1].split("&"),e=b[0].split("=")[1],c=b[1].split("=")[1];a.waitUntil(clients.matchAll({type:"window"}).then(function(a){for(var b=0;b<a.length;b++){var d=a[b];if("/"==d.url&&"focus"in d)return d.focus()}if(clients.openWindow)return a=(0,eval)("this"),clients.openWindow(a._bpush_env.endpoint_base+"/sapi/v1/click?app_key="+a._bpush_env.app_key+
"&nid="+e+"&sid="+c)}))}});self.addEventListener("activate",function(a){a.waitUntil(self.clients.claim())});
