

# Module UI function
ttestsUI <- function(id) {
  
  # `NS(id)` returns a namespace function, which was save as `ns` and will
  # invoke later.
  ns <- NS(id)
  
  mainPanel(

  br(),
  br(),
  br(),
  h1("a. Video Lecture: T-Tests"),
  br(),
  br(),
  tags$div(style="display:inline-block;width:500px;height:200;",
           title="Video: T-tests",
           #tags$a(
           #  class = "shiny__link",
           #  href = to,
           #  label
           #),
           actionButton("info",
                        label=NULL,
                        #h4("Video Lecture: T-tests"),
                        #icon = icon("info-circle"),
                        style="width: 350px;
                                height: 200px;
                                #padding: 10px; 
                                font-size: 200%;
                                background: url('vidLectImage.png');
                                background-size: cover;
                                background-position: center;"
                        )
           ),
  
#  a("Video: T-tests", href="Statstical Literacy Lecture 13.mp4", target="_blank"),
  #tags$video(type = "video/mp4",src = "Statstical Literacy Lecture 13.mp4", controls = "controls"),
    br(),
br(),
br(),
br(),
br(),
br(),
tabsetPanel(type = "tabs",
            
            tabPanel("Home",
                     style = "background-color: #818e9f;",
                     br(),
column(12,style = "border: 2px solid black;",
       h2("b. Hypotheses 1"),
       br(),
       "Enter your null hypothesis for the difference in population means below.",
       br(),
       br(),
       numericInput("nullDiff",HTML(paste0(
         "Enter a value for \u03BC",tags$sub("0"),", where \u03BC",tags$sub("0")," = \u03BC",tags$sub("2")," - \u03BC",tags$sub("1"),"."
       )),value=0),
       br(),



  column(11,style = "border: 2px solid black;",
  h2("b. Hypotheses"),
  br(),
  "Enter your null hypothesis for the difference in population means below.",
  br(),
  br(),
  numericInput("nullDiff",HTML(paste0(
    "Enter a value for \u03BC",tags$sub("0"),", where \u03BC",tags$sub("0")," = \u03BC",tags$sub("2")," - \u03BC",tags$sub("1"),"."
  )),value=0),
  br()
  ),
  

  
  column(11,
  br(),
  br(),
  br(),
  br()
  ),
 
  column(11,style = "border: 2px solid black;",
         h2("c. Data"),
         br(),
         "Enter the labels for your variables, your group names, and your data below.",
         br(),
         br(),
         textInput("outcomeLabel","Enter Outcome Label",value="Body Mass Index"),
         textInput("predLabel","Enter Predictor Label",value="Treatment Group"),
         br(),
  column(5, matrixInput(
                                  inputId = "matrix1a",
                                  label = "Enter Group 1 Name & Data",
                                  value = matrix(c(21,23,22,20,24,21,21,22),ncol=1,nrow=8,dimnames=list(NULL,c("Treatment"))),
                                  class = "numeric",
                                  cols = list(
                                    names = TRUE,
                                    editableNames = TRUE
                                  ),
                                  rows = list(
                                    names = FALSE,
                                    extend=TRUE,
                                    delta=1
                                  )
                                  #,
                                  #cells = list(editableCells = FALSE)
                                )),
  column(5, matrixInput(
    inputId = "matrix1b",
    label = "Enter Group 2 Name & Data",
    value = matrix(c(26,28,27,25,28,27,26,27,27,26),ncol=1,nrow=10,dimnames=list(NULL,c("Control"))),
    class = "numeric",
    cols = list(
      names = TRUE,
      editableNames = TRUE
    ),
    rows = list(
      names = FALSE,
      extend=TRUE,
      delta=1
    )
    #,
    #cells = list(editableCells = FALSE)
  )),
  br(),
  "",
  br()
  ),
  
  column(11,
         br(),
         br(),
         br(),
         br()
  ),
  

  
column(11, style = "border: 2px solid black;",

       h2("d. Model Assumptions"),
       br(),
       h3("ii. Normality"),
       "Use the following plots to assess the assumption of normality.",
       br(),
       br(),
  column(5, 
         h4("Distribution of Data"),
         br(),
         plotOutput("histogram2",height=300),
         br(),
         plotOutput("histogram3",height=300)
  ),
  column(5, 
         h4("Distribution of Bootstrapped Sample Means"),
         br(),
         plotOutput("histogram4",height=300),
         br(),
         plotOutput("histogram5",height=300)
  ),
  br(),
  br(),
  br(),
  br(),
  column(11,
         br(),
         br(),
  h3("ii. Equality of Variances"),
  "Student's t-test in its original form assumes equal variances in the two populations. Welch's t-test, 
       also known as the unequal variances t-test, does not assume equal variances in the two groups. The 
       t-test used below is the Welch's t-test. While there are ways to test for equality of variances, those tests 
       are not used here. This is because Welch's t-test performs better than Student's t-test with unequal variances 
       AND performs nearly as well as Student's t-test when the variances are equal. A test for equality of variances, 
       like any hypothesis test, risks both Type I and Type II errors. Because of this, we recommend the use of Welch's 
       t-test instead of Student's t-test and do not recommend testing for equality of variances. Note that Welch's t-test
       retains the normality assumption addressed above.",
       br(),
       br()
  ),
  br(),
  br(),
  ),
  


column(11,
       br(),
       br(),
       br(),
       br()
),



column(11, style = "border: 2px solid black;",

       h2("e. Test Output"),
       br(),
       "The following gives the output of your t-test.",
       br(),
       br(),
       h3("i. Estimates"),
       tableOutput("ttest1"),
       br(),
       h3("ii. Test Results"),
       tableOutput("ttest2"),
       br(),
       br(),
       br()
),
       
column(11,
       br(),
       br(),
       br(),
       br()
),



column(11, style = "border: 2px solid black;",
       h2("f. Results"),
       br(),
       "The following table is a publication-worthy way to display your results. 
       The figure below is one way to graphically display your results.",
       br(),
       br(),
       tableOutput("ttestTable"),
       br(),
       br(),
       br(),
       br(),
       br()
       ),

column(11,
       br(),
       br(),
       br(),
       br()
),



column(11, style = "border: 2px solid black;",
       h2("g. Write-Up"),
       h3("i. Methods"),
       "The following is an example of what one might write about this test in the methods section of a paper. 
       This example uses the BMI data and test present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
       br(),
       br(),
       em("An unequal-variances (Welch's) t-test compared mean BMI in the treatment group to that of 
       the control group using a two-tailed type I error rate of \u03B1 = 0.05. The distributional assumption of 
       normality was examined graphically using histograms."),
       br(),
       br(),
       h3("ii. Results"),
       "The following is an example of what one might write about the results of this test in the results section of a paper. 
       This example uses the BMI data and test present when this page loads. Refresh this page to see it again if 
       you've changed anything along the way.",
       br(),
       br(),
       em("The mean BMI in the control group was 26.70 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          26.02 kg/m",tags$sup("2")," to 27.38 kg/m",tags$sup("2"),". In the treatment group, the mean was
          21.75 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          20.68 kg/m",tags$sup("2")," to 22.82 kg/m",tags$sup("2"),". Mean BMI differed significantly between the 
          two groups (p<0.0001), as the treatment group mean was 4.95 kg/m",tags$sup("2")," lower than the control 
          group mean, with a 95% confidence interval of 3.35 kg/m",tags$sup("2")," lower to 6.55 kg/m",tags$sup("2")," lower."),
       

       br(),
       br(),
       br()
),
column(12,
       br(),
       br(),
       br(),
       br()
)
)
),
tabPanel("Paired T-Test",
                     style = "background-color: white;",
                     br(),
column(12,
       br(),
       br(),
       br(),
       br()
)
)
)


  
  )
  
}









#ttestsServer <- function(id) {
#  moduleServer(
#    id,
#    ## Below is the module function
#    function(input, output, session) {
#      
#      
#      dat1<-c(1,3,2,6,5,1,2,3,4,5,2,3,4,3)
#      dat2<-dat1+8
#      tOut<-t.test(x=dat1,y=dat2)
#      
#      dat11<-cbind(dat1,dat1)
#      dat11[,2]<-1
#      
#      dat12<-cbind(dat2,dat2)
#      dat12[,2]<-2
#      
#      dat_2<-rbind(dat11,dat12)
#      datAll<-data.frame("Group"=dat_2[,2],"Outcome"=dat_2[,1])
#      
#      output$boxPlot2<-renderPlot({ggplot(datAll, aes(y=Outcome,group=Group)) + geom_boxplot()})
#      
#      #matrix1<-updateMatrixInput(session, matrix1, value = NULL)
#      
#      #output$matrix1<-renderTable({table(matrix1)})
#      
#      
#    }
#  )    
#}
  

  
  
  
  
  
  
  