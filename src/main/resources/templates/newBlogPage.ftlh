<#import "block/main.ftlh" as main />

<@main.renderWith scripts=[]>
    <#list posts as post>
        <div class="card alert alert-info mt-2">
            <h5 class="card-header">Время: ${post.dateTime}
                <#if post.dateTime.getDayOfMonth()  &lt; dateNow.getDayOfMonth()
                || post.dateTime.getMonthValue()  &lt; dateNow.getMonthValue()
                || post.dateTime.getYear() &lt; dateNow.getYear()>
                    <p>Просрочка - ${daysBetween} дней</p>
                <#elseif post.doneDairy==false >
                    <div></div>
                <#elseif post.doneDairy==true ||post.dateTime.getDayOfMonth()  &lt; dateNow.getDayOfMonth()
                || post.dateTime.getMonthValue()  &lt; dateNow.getMonthValue()
                || post.dateTime.getYear() &lt; dateNow.getYear()>
                    <div></div>
                </#if>
            </h5>
            <div class="card-body">
                <h5 class="card-title">${post.title}</h5>
                <p class="card-text">${post.fullText}</p>
                <a href='/blog/${post.id}/edit' class="btn mb-2  btn-warning"> Редактировать</a>
                <form action='/blog/${post.id}/delete' method="post" style="margin-left: 9rem; margin-top: -45px;">
                    <button class="btn btn-warning" type="submit"> Удалить</button>
                </form>

            </div>
        </div>
    </#list>

</@main.renderWith>