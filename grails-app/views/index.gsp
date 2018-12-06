<%@ page import="practica12.web.grails.Departamento" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Black Mesa Admin</title>
    <meta charset="UTF-8" />
    <meta name="layout" content="main" />

</head>
<body>

    <div id="content" class="container-fluid">

            <div class="row-fluid">

                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"> <i class="icon-bar-chart"></i> </span>
                            <h5><g:message code="grafica.label"/></h5>
                        </div>
                        <div class="widget-content">
                            <%
                                def columns = [['string', message(code:'departamento.label')], ['number', message(code:'contacto.label')+'s']]

                                def cata = []
                                for (int i = 0; i < departamentoList.size() ; i++) {
                                    def thing = [departamentoList.get(i).nombre, departamentoList.get(i).conts.size()]
                                    cata.add(thing)

                                }


                            %>

                            <gvisualization:pieCoreChart elementId="piechart" title="${message(code:'grafica.departamento.label')}" width="${450}" height="${300}"
                                                         columns="${columns}" data="${cata}" />

                            <div id="piechart"></div>
                        </div>
                </div>
                </div>

                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"> <i class="icon-bar-chart"></i> </span>
                            <h5><g:message code="grafica.label"/></h5>
                        </div>
                        <div class="widget-content">
                            <%

                                def columns2 = [['string', message(code:'categoria.label')], ['number', message(code:'contacto.label')+'s']]

                                def cata2 = []

                                for (int i = 0; i < categoriaList.size() ; i++) {
                                    def count = 0
                                    for (int j = 0; j < contactoList.size() ; j++) {
                                        if(contactoList.get(j).categoria == categoriaList.get(i))
                                            count++
                                    }
                                    def thing = [categoriaList.get(i).nombre, count]
                                    cata2.add(thing)

                                }

                            %>
                            <gvisualization:pieCoreChart elementId="piechart2" title="${message(code:'grafica.categoria.label')}" width="${450}" height="${300}"
                                                         columns="${columns2}" data="${cata2}" />

                            <div id="piechart2"></div>
                        </div>
                    </div>
                </div>

        </div>

    </div>

</body>
</html>
