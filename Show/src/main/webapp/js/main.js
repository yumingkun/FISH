window.onscroll=function(){
    // 导航栏动画---------------------------------------------------
    var top=document.documentElement.scrollTop||document.body.scrollTop;
    var header=document.getElementById("headerAnimate");
    // 导航条黑色动画
    if(top>70){//加上动画样式
        header.classList.add("header_status_black");
    }else{//清除样式
        header.classList.remove("header_status_black");
    }


    // 返回顶部动画------------------------------------------------
    let obtn=document.getElementById('btn');
    if (top>=600){
        obtn.style.display='block';
    }else {
        obtn.style.display='none';
    }
};