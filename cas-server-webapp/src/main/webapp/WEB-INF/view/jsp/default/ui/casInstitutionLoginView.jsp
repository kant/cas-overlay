<%--

    Licensed to Apereo under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Apereo licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License.  You may obtain a
    copy of the License at the following location:

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<%-- OSF CAS institution login page --%>

<jsp:directive.include file="includes/top.jsp"/>

<div id="inst-login">
    <section class="row">
        <div class="heading">
            <span><spring:message code="screen.institution.login.heading"/></span>
        </div>
    </section>
    <br>
    <section class="row">
        <div class="select">
            <label for="select-institution"><spring:message code="screen.institution.login.select" /></label>
        </div>
    </section>
    <section class="row">
        <div class="select">
            <form:select class="select" id="institution-form-select" name="select-institution" path="institutions" items="${institutions}"/>
        </div>
    </section>
    <br>
    <section class="row">
        <div class="btn-submit">
            <input type="button" name="submit" value="<spring:message code="screen.welcome.button.login" />" onclick="institutionLogin()">
        </div>
    </section>

    <%-- OSF Username and Password Login --%>
    <br/><hr/><br/>
    <spring:eval var="osfLoginUrl" expression="@casProperties.getProperty('cas.osf.login.url')"/>
    <c:set var="serviceParam" value="&service=${osfLoginContext.isServiceUrl() ? osfLoginContext.getServiceUrl() : ''}"/>
    <section class="row">
        <a id="alt-login-osf" class="btn-alt-login" href="${osfLoginUrl}${serviceParam}">
            <img class="osf-alt-logo" src="../images/osf-alt-logo.png">
            <span class="label-login"><spring:message code="screen.institution.login.osf"/></span>
        </a>
    </section>

    <script>
        function institutionLogin () {
            var institutionForm = document.getElementById('institution-form-select');
            var institutionLoginUrl = institutionForm.options[institutionForm.selectedIndex].value;
            if(institutionLoginUrl == null || institutionLoginUrl === "") {
                return;
            } else if (institutionLoginUrl === "callutheran") {
                institutionLoginUrl = "${callutheranUrl}";
            } else if (institutionLoginUrl === "ferris") {
                // Disable institution login Ferris State University
                return;
            } else if (institutionLoginUrl === "okstate") {
                institutionLoginUrl = "${okstateUrl}";
            }
            window.location = institutionLoginUrl;
        }
    </script>
</div>

<c:set var="linkSignIn" value="false"/>
<c:set var="linkSignOut" value="false"/>
<c:set var="linkCreateAccount" value="true"/>
<c:set var="linkBackToOsf" value="true"/>

<jsp:directive.include file="includes/bottom.jsp"/>
