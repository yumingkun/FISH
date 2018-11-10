<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style type="text/css">

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
            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                <div class="panel-body">
                    <p class="myTwo"><a href="<%=request.getContextPath()%>/manage/getUsers.do">用户管理</a></p>
                    <p class="myTwo"><a href="<%=request.getContextPath()%>/manage/category.do">分类管理</a></p>
                    <p class="myTwo">轮播管理</p>
                </div>
            </div>
        </div>
        <div class="panel">
            <div class="panel-heading" role="tab" id="headingTwo">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        其它设置
                    </a>
                </h4>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                <div class="panel-body">
                    <p class="myTwo"><a href="/manage/getUsers.do">用户管理</a></p>
                    <p class="myTwo">角色管理</p>
                    <p class="myTwo">状态管理</p>
                </div>
            </div>
        </div>
        <div class="panel">
            <div class="panel-heading" role="tab" id="headingThree">
                <h4 class="panel-title">
                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        其它设置
                    </a>
                </h4>
            </div>
            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                <div class="panel-body">
                    <p class="myTwo"><a href="/manage/getUsers.do">用户管理</a></p>
                    <p class="myTwo">角色管理</p>
                    <p class="myTwo">状态管理</p>
                </div>
            </div>
        </div>
    </div>
