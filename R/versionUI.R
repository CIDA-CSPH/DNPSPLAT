

versionUI<-function(id){
  
}







versionServer<- function(id) {
  moduleServer(
    id,
    ## Below is the module function
    function(input, output, session) {
      #myName<-reactive({
      #  "Bryan McNair, MS"
      #})
      #
      #myAffiliation<-reactive({
      #  paste("Center for Innovative Design and Analysis",
      #  br(),
      #  "Department of Biostatistics and Informatics",
      #  br(),
      #  "Colorado School of Public Health",
      #  br(),
      #  "University of Colorado Anschutz Medical Campus")
      #})
      
      version<-reactive({
        1.1
      })
      
      
      
    })}