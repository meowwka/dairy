<#import "block/main.ftlh" as main />

<@main.renderWith scripts=["/js/script.js"]>
    <#list posts as el>
        <#if el.doneDairy==true || el.dateTime.getDayOfMonth()  &lt; dateNow.getDayOfMonth()
        || el.dateTime.getMonthValue()  &lt; dateNow.getMonthValue()
        || el.dateTime.getYear() &lt; dateNow.getYear()>
            <div class="alert alert-info mt-2">
                <h3>${el.title}</h3>
                <a href="${el.id}" class="btn btn-warning">Подробнее</a>
                <form action="/doneDairy" method="post">
                    <input type="hidden" name="id" value="${el.id}"/>
                    <#if el.doneDairy==false>
                        <button class="btn btn-success" style="margin-left: 8rem; margin-top: -64px;">Закончить</button>
                    <#else >
                        <span style=" margin-left: 8rem;    margin-top: -4rem;" class="btn btn-success">Закончен</span>
                    </#if>
                </form>
            </div>
        <#elseif el.doneDairy==false || el.dateTime.getDayOfMonth()  &lt; dateNow.getDayOfMonth()
        || el.dateTime.getMonthValue()  &lt; dateNow.getMonthValue()
        || el.dateTime.getYear() &lt; dateNow.getYear()>
            <div class="alert alert-danger mt-2">
                <h3>${el.title}</h3>
                <a href="${el.id}" class="btn btn-warning">Подробнее</a>
                <form action="/doneDairy" method="post">
                    <input type="hidden" name="id" value="${el.id}"/>
                    <button class="btn btn-success" style="margin-left: 8rem; margin-top: -64px;">Закончить</button>
                </form>
            </div>
        </#if>
    </#list>
</@main.renderWith>