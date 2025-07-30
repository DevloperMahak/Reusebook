'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "3c7968662162922af6fe4c5c2b737d09",
"assets/AssetManifest.bin.json": "c129ed4aa789c928b1efc0f1d656216f",
"assets/AssetManifest.json": "995471376f34b4939e88a7cc8d282579",
"assets/assets/images/144386-OTFX3B-277.jpg": "846dff0c8d966ba9ef31ed250be242b4",
"assets/assets/images/active.png": "ccb1086c9f98d5d9eb47b9fef31447dd",
"assets/assets/images/add-to-cart.png": "c3934a34530ee7ab97e91ebd03d29bc0",
"assets/assets/images/advertising%2520(1).png": "c43ba05b1297664a4390d2ca562400bc",
"assets/assets/images/axi0_fky7_220310.jpg": "96befc0f7a93207f35e562f3ad378bb0",
"assets/assets/images/best-price%2520(1).png": "1446c93eac7bf81ca3e790b4fd436359",
"assets/assets/images/best-seller.png": "1f2a3af4e7ff110d66d2cd401f58137d",
"assets/assets/images/book.png": "21a413ed4645c04a46667c83c03171d0",
"assets/assets/images/books-with-graduation-cap-digital-art-style-education-day.jpg": "62e0502fd2a2991787da1759525cc465",
"assets/assets/images/categories.png": "d829d2148e1ab7b672ef3b66ecae5377",
"assets/assets/images/create-a-flat-vector-illustrative-style-lettermark-dZYh0NYtTOmZ38Q-v7IuVQ-HROmqDXwRqaUP-beJuUCMg.jpeg": "91de885c21cc2a6b0e30c765ab6d6ff3",
"assets/assets/images/Enter%2520OTP-rafiki.png": "14c83e733d71ca742a4fa815b8844c51",
"assets/assets/images/Forgot%2520password-rafiki.png": "05b27abb428ae50ec9245882a9f2aacc",
"assets/assets/images/google-analytics.png": "4197cf75db54669aeb48decbf2cad0ef",
"assets/assets/images/merchant.png": "d382bd381655ac68cb2bc1c630e28ea3",
"assets/assets/images/otherBooks.jpg": "5ae625c135215abc5752c9ca7eb203f1",
"assets/assets/images/package.png": "8578a81036c6543b72cbbbb65cc5fcf3",
"assets/assets/images/Paper-recycling.jpg": "ec47ceef040025cfd6eed6536aca9dfd",
"assets/assets/images/pay%2520(1).png": "4934ecef1677b5ec3aff5aa148f383fe",
"assets/assets/images/recycle.jpg": "4f1109ffa40cea6d538e5f3e7f4cc838",
"assets/assets/images/Reset%2520password-pana.png": "76f9002b176ce6ed86fbe456e3736d11",
"assets/assets/images/Reusebook%2520logo.png": "78ae4a818e955d6657234ae3a075d552",
"assets/assets/images/save%2520paper.png": "5350f7666f1669eb7d2964af925d92e1",
"assets/assets/images/save%2520tree.jpg": "a8da7533545b242817603ee22f7de07e",
"assets/assets/images/sell.png": "936d60c64dbbec78efbe8f3aa9a535d0",
"assets/assets/images/Sign%2520up-rafiki.png": "0c496adffd89338a98048b6633bd2654",
"assets/assets/images/Tablet%2520login-rafiki.png": "fc36a6e8f891b6a30f649bf592d040fc",
"assets/assets/images/Translator-pana%25201.png": "aa116b4fbc50be30ed6a1dec3937cc1b",
"assets/assets/images/user-avatar.png": "9f8d00e776f605ed85be92e499353838",
"assets/assets/images/woman.png": "a975934bb378afc4ca8c133df451f56e",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "20422d8318c7f18bbb5d17b5de0a92cc",
"assets/NOTICES": "9c92c1ac69f77ccfc5a61bd2ad4e8217",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "a8ff56ff6d626fb10c01155f169acc04",
"canvaskit/canvaskit.wasm": "2599e52fc951fff3195579e05641305f",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "90e4ca665873b63614740f3704102c93",
"canvaskit/chromium/canvaskit.wasm": "33ca35b78e308e0e53f26f640fd1d32f",
"canvaskit/skwasm.js": "ede049bc1ed3a36d9fff776ee552e414",
"canvaskit/skwasm.js.symbols": "3356eddd0604094198785874d3b10e8a",
"canvaskit/skwasm.wasm": "66a403b30ddd7a862c6dab468e600cef",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "48f37afd97839df0c35dfb6ff1c3eb6a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d7fab9810bc9f77552f88abd02285f41",
"/": "d7fab9810bc9f77552f88abd02285f41",
"main.dart.js": "b8ce517cc28e6f8e3352acc41997674f",
"manifest.json": "5516b42a8e682b3d43749719d511f7a0",
"version.json": "531618970a1b4baa45fea519eaed21a8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
