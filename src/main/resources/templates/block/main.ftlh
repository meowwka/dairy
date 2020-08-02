<#macro renderWith title="" scripts=[] styles=[]>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>${title}</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <#list styles as styleSource>
            <link rel="stylesheet" href="${styleSource}"/>
        </#list>
    </head>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <div class="container">
            <nav class="my-2 my-md-0 mr-md-3">
                <a class="p-2 text-dark" href="/">Главная</a>
                <a class="p-2 text-dark" href="/blog/add">Добавить задачу</a>
                <span class="border-bottom ">${date}</span>
            </nav>
        </div>
    </div>
    <body>
    <div class="container">
        <#nested>
    </div>
    <#list scripts as scriptSource>
        <script src="${scriptSource}"></script>
    </#list>
    </body>
    </html>
</#macro>