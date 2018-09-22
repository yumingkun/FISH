//  页面加载完成后触发
window.onload=function () {
    let obtn=document.getElementById('btn');
    let timer=null;
    // 获取可视区的高度：当前屏幕的高度
    let clientHeight=document.documentElement.clientHeight;


    // 点击返回顶部
    obtn.onclick=function () {
        // 设置定时器，使点击回到顶部的速度变慢
        timer=setInterval(function () {
            // 获取滚动条到顶部的距离
            let top1=document.documentElement.scrollTop || document.body.scrollTop;
            console.log(top1);
            document.documentElement.scrollTop -= 50;
            console.log(top1);
            // 清除定时器
            if (top1 === 0){
                clearInterval(timer);
            }
        },10);

    };

    // 按钮的显示或隐藏
    window.onscroll=function () {
        // 获取滚动条到顶部的距离
        let top1=document.documentElement.scrollTop || document.body.scrollTop;
        if (top1>=clientHeight){
            obtn.style.display='block';
        }
        else {
            obtn.style.display='none';
        }
    }

};