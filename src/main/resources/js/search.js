$(function() {
  var $result = $("#result");
  var $queryId = $("#queryId");
  var $favorites = $(".favorite", $result);
  var $searchButton = $("#searchButton");
  var contextPath = $("#contextPath").val();

  $("#searchForm").on("submit", function(e) {
    $searchButton.attr("disabled", true);
    setTimeout(function() {
      $searchButton.attr("disabled", false);
    }, 3000);
    return true;
  });

  $result.on("mousedown", "a.link", function(e) {
    var docId = $(this).attr("data-id"),
      rt = $("#rt").val(),
      queryId = $("#queryId").val(),
      order = $(this).attr("data-order"),
      url = $(this).attr("href"),
      buf = [];
    buf.push(contextPath);
    buf.push("/go/?rt=");
    buf.push(rt);
    buf.push("&docId=");
    buf.push(docId);
    buf.push("&queryId=");
    buf.push(queryId);
    buf.push("&order=");
    buf.push(order);

    var hashIndex = url.indexOf("#");
    if (hashIndex >= 0) {
      var hashStr = url.substring(hashIndex);
      buf.push("&hash=");
      buf.push(encodeURIComponent(hashStr));
    }

    $(this).attr("href", buf.join(""));
  });

  $result.on("mouseover", "a.link", function(e) {
    var docId = $(this).attr("data-id"),
      rt = $("#rt").val(),
      url = $(this).attr("href"),
      buf = [];
    buf.push(contextPath);
    buf.push("/go/?rt=");
    buf.push(rt);
    buf.push("&docId=");
    buf.push(docId);

    var hashIndex = url.indexOf("#");
    if (hashIndex >= 0) {
      var hashStr = url.substring(hashIndex);
      buf.push("&hash=");
      buf.push(encodeURIComponent(hashStr));
      buf.push(hashStr);
    }
  });

  if (typeof $.fn.suggestor === "function") {
    $("#query").suggestor({
      ajaxinfo: {
        url: contextPath + "/suggest",
        fn: "_default,content,title",
        num: 10,
        lang: $("#langSearchOption").val()
      },
      boxCssInfo: {
        border: "1px solid rgba(82, 168, 236, 0.5)",
        "-webkit-box-shadow":
          "0 1px 1px 0px rgba(0, 0, 0, 0.1), 0 3px 2px 0px rgba(82, 168, 236, 0.2)",
        "-moz-box-shadow":
          "0 1px 1px 0px rgba(0, 0, 0, 0.1), 0 3px 2px 0px rgba(82, 168, 236, 0.2)",
        "box-shadow":
          "0 1px 1px 0px rgba(0, 0, 0, 0.1), 0 3px 2px 0px rgba(82, 168, 236, 0.2)",
        "background-color": "#fff",
        "z-index": "10000"
      },
      listSelectedCssInfo: {
        "background-color": "rgba(82, 168, 236, 0.1)"
      },
      listDeselectedCssInfo: {
        "background-color": "#ffffff"
      },
      minterm: 1,
      adjustWidthVal: 11,
      searchForm: $("#searchForm")
    });
  }

  IMG_LOADING_DELAY = 200;
  IMG_LOADING_MAX = 0;
  var loadImage = function(img, url, limit) {
    var imgData = new Image();
    $(imgData).on("load", function() {
      $(img).css("background-image", "");
      $(img).attr("src", url);
    });
    $(imgData).on("error", function() {
      if (limit > 0) {
        setTimeout(function() {
          loadImage(img, url, --limit);
        }, IMG_LOADING_DELAY);
      } else {
        // $(img).attr('src', contextPath + "/images/noimage.png");
        $(img)
          .parent()
          .parent()
          .css("display", "none");
      }
      imgData = null;
    });
    imgData.src = url;
  };

  $("img.thumbnail").each(function() {
    $(this).css(
      "background-image",
      'url("' + contextPath + '/images/loading.gif")'
    );
    loadImage(this, $(this).attr("data-src"), IMG_LOADING_MAX);
  });
});
