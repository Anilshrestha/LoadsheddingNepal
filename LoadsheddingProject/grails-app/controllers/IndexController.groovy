

import grails.converters.JSON
import loadsheddingmap.ContributorSubmitData
import loadsheddingmap.User
import org.codehaus.groovy.grails.commons.ConfigurationHolder

class IndexController {
    def springSecurityService
    def exportService

    def index() {
        println("here")

        println("should be true: "+springSecurityService.isLoggedIn())
        println("p: "+params);
        if (springSecurityService.isLoggedIn()) {
            def role = springSecurityService.getAuthentication().authorities.toString()
            println("a: "+role.substring(1,10));
            def currentUser = User.findById(springSecurityService.principal.id)
            println("current user:"+currentUser)
            session["currentUserId"]=currentUser.id
            session["userName"] = currentUser.username

            if(!currentUser.contributor) {

            }


            if(role.substring(1,10).equalsIgnoreCase("role_user")) {
                session["roles"] = "ROLE_USER"
                redirect(controller:'index', action:'dashboard')
            }else {
                session["roles"] = "ROLE_ADMIN"
                redirect(controller:'index', action:'adminDashboard')
            }
        }
        else {
            render view: 'index'
        }
    }

    def adminDashboard() {
        def data = ContributorSubmitData.findAll();
        render (view:"adashboard",model: ["res":data]) ;
    }

//    @Secured(['ROLE_ADMIN'])

    def insertUserSubmittedData() {
        def currentUser = SecUser.findById(springSecurityService.principal.id).contributor;

        def data = params.inputdata.split(";");
        def res = ContributorSubmitData.executeQuery("select groupName, latitude,longitude from ContributorSubmitData d where d.id=? and latitude=? ",[currentUser.id,data[0]])

        if(res.empty) {
            def insertData = new ContributorSubmitData();
            insertData.groupName = data[0];
            insertData.latitude = data[1];
            insertData.longitude = data[2];
            insertData.contributor = currentUser;
            insertData.save(flush: true);
//            def ress = ContributorSubmitData.findAllByContributor(currentUser)
            render("success");

        }else{
            render("error")
        }
    }


//    @Secured(['ROLE_USER'])

    def insertLateSubmitted() {
        def currentUser = User.findById(springSecurityService.principal.id).contributor;
        def res = ContributorSubmitData.executeQuery("select groupName from ContributorSubmitData where contributor =? order by id desc",[currentUser])

        render(res.get(0))
    }
    def user() {
        render view:"../login/register";
    }

    def exportToExcel() {
        def exportList=[];
        def data = ContributorSubmitData.findAll();

        def lat;
        def lng;
        def groupName;
        data.each {
           lat = it.latitude
            lng = it.longitude
            groupName = it.groupName

            exportList << [latitude: it.latitude,longitude:it.longitude,groupname : it.groupName]
        }

        if(params?.format && params.format != "html") {
            response.contentType = ConfigurationHolder.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=LoadsheddingGroupData.${params.extension}")
            List fields = [
                    "latitude",
                    "longitude",
                    "groupname",
            ]

            Map labels=["latitude":"Latitude","longitude":"Longitude","groupname":"Group Name"]
            Map parameters =["column.widths": [0.15, 0.3,0.15]]
            exportService.export(params.format, response.outputStream,exportList, fields, labels,[:],parameters)
        }



    }

    def dashboard() {
        def currentUser = User.findById(springSecurityService.principal.id).contributor;

        def res = ContributorSubmitData.findAllByContributor(currentUser)
        render (view:"dashboard",model: ["res":res]) ;
    }



    def save() {
        println(params)

//        def secuser = new SecUser(params);
//        def cInstance = new Contributor(params);
//        secuser.enabled = true
//        secuser.contributor=cInstance
//
//        Contributor.withTransaction {
//            status->
//                try{
//                    def contSaved = cInstance.save(flush:true)
//                    println("saved")
//                }catch (Exception e) {
//                    e.printStackTrace()
//                }
//        }
//
//        println(params.fullName)


    }


    def loadsheddingSchedule() {
//        def list = Loadsheddingschedule.findAll()
//        String[][] lsArr = new String[7][7];
//
//        lsArr[0][0] = "09:00-01:00 05:00-09:00";
//        lsArr[0][1] = "11:00-03:00 08:00-11:00";
//        lsArr[0][2] = "10:00-02:00 06:00-10:00";
//        lsArr[0][3] = "08:00-11:00 05:00-08:00";
//        lsArr[0][4] = "07:00-10:00 03:00-06:00";
//        lsArr[0][5] = "06:00-09:00 02:00-05:00";
//        lsArr[0][6] = "06:00-08:00 01:00-05:00";
//
//        int rows=7;
//        int col=7
//        int tempx=0;
//        int tempy=7;
//
//        def ls=new ArrayList<>();;
//
//        for(int i=0;i<rows;i++) {
//            for(int j=0;j<col;j++) {
//                if(i==0) {
//                    lsArr[i][j] +", "
//                    ls.add(lsArr[i][j])
//                }else if(i>0 && i<7) {
//                    if(j==0) {
//                        lsArr[tempx][tempy] +", "
//                        ls.add(lsArr[tempx][tempy])
//                    }else {
//                        lsArr[tempx][j-1] +", "
//                        ls.add(lsArr[tempx][j-1])
//                    }
//
//                }
//
//            }
//            tempy--;
//            println(" ")
//        }
//
//        render list as JSON



    }


}
