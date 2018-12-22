<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">

    a,a:hover,a:active{
        text-decoration: none;
    }
    /*小图标*/
    .glyphicon{
        float: right;
    }
    /*二级菜单*/
    .myTwo{
        margin-left: 10px;
    }
</style>
<div   class="panel-group info" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="panel ">
            <div class="panel-heading" role="tab" id="headingOne">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        系统设置 <span class="glyphicon glyphicon-cog"></span>
                    </a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse " role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">
                    <p class="myTwo"><a href="<%=request.getContextPath()%>/manage/category.do">专题管理</a></p>
                    <p class="myTwo"><a href="<%=request.getContextPath()%>/manage/toCarousel.do">轮播管理</a></p>
                </div>
            </div>
        </div>

    <div class="panel">
        <div class="panel-heading" role="tab" id="headingTwo">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    文章管理 <span class="glyphicon glyphicon-user"></span>
                </a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
            <div class="panel-body">
                <p class="myTwo"><a href="<%=request.getContextPath()%>/manage/getUsers.do">用户管理</a></p>
                <p class="myTwo"><a href="<%=request.getContextPath()%>/manage/toAuditing.do">文章管理</a></p>
            </div>
        </div>
    </div>
    <div class="panel">
        <div class="panel-heading" role="tab" id="headingTh">
            <h4 class="panel-title">
                <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    图表展示 <span class="glyphicon glyphicon-stats"></span>
                </a>
            </h4>
        </div>
        <div id="headingThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
            <div class="panel-body">
                <p class="myTwo"><a href="<%=request.getContextPath()%>/manage/toShowCategoryChart.do">专题图表</a></p>
                <p class="myTwo"><a href="<%=request.getContextPath()%>/manage/toShowUserChart.do">用户图表</a></p>

            </div>
        </div>
    </div>

</div>
