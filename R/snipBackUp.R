

observeEvent(
  input$snip1a1,{ showModal(modalDialog( tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), column(width = 12,
                                                                                                                                                                h3("Hypotheses"),
                                                                                                                                                                HTML(paste0(
                                                                                                                                                                  "The standard null hypothesis H",tags$sub("0")," for a two-sample t-test is that the two means  \u03BC",tags$sub("1")," and \u03BC",tags$sub("2")," (the population means for the two groups) are equal in the population, meaning  \u03BC",tags$sub("1")," = \u03BC",tags$sub("2"),". Stated differently, the standard null hypothesis is that the difference between the two population means is zero, or \u03BC",tags$sub("2")," - \u03BC",tags$sub("1")," = 0. Of course, this doesn't mean that the two SAMPLE means will be equal, even if the null hypothesis is true, due to sampling variability. The question is, are the sample means different enough, given the data, that we can reject the null hypothesis at some level of statistical significance, usually 0.05? And, while the null hypothesis is usually that the population means are equal, or, equivalently, that the difference between the population means is 0, we can decide to use a different value for the null hypothesis if it makes sense to do so. For instance, if we're looking at getting a new car, we may not care that it has exactly the same fuel economy as our old car, because it has other nice features that our old car did not. But, we may not want its fuel economy to drop more than 5 miles per gallon compared to our old car. We could test this difference of 5 mpg with a sufficient sample of each kind of car. Obviously, this might not be practical for a consumer, but may be practical for an automaker.",
                                                                                                                                                                  br(),
                                                                                                                                                                  br(),
                                                                                                                                                                  "The standard null hypothesis for a paired t-test is that the mean change between time points or replicates \u0394\u03BC for a given person or experimental unit is 0 in the population. The associated alternative hypothesis is that the population mean change is not equal to 0. However, under circumstances similar to those above, we might want to use different null and alternative hypotheses that test whether the mean change is no greater than or no less than some value.",
                                                                                                                                                                  br(),
                                                                                                                                                                  br(),
                                                                                                                                                                  "Note that the correct way to interpret \u03BC",tags$sub("2")," - \u03BC",tags$sub("1")," from the two-sample t-test is the 'difference in means', while the correct way to interpret \u0394\u03BC from the paired t-test is the 'mean difference'."
                                                                                                                                                                  
                                                                                                                                                                )),
                                                                                                                                                                br(), br() ) ) )) })
observeEvent(
  input$snip1a2,{showModal(modalDialog(tags$div(style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
                                                h3("Hypotheses"), tags$iframe(width="1280", height="720",
                                                                              src = "snip1a2.mp4",
                                                                              #src = "video6i.pdf",
                                                                              frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })




observeEvent(
  input$snip1b1,{ ##### Change this one every time
    showModal(
      modalDialog( 
        tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                  column(width = 12,
                         h3("Data"), ##### Change this one every time and text below
                         "Remember that, for a 2-sample t-test, the outcome is numeric and the predictor is binary (categorical with two categories). 
           One way to organize the required data is with two columns of numbers, one for each predictor category. The numbers themselves represent the observed outcome values.
           This is how we organize our data here, whether it's entered by hand our uploaded from an Excel file.",
           br(),
           br(),
           "Note that you do not need the same number of observations per group for a 2-sample t-test, so it's ok if the columns of numbers below are of unequal length. If uploading from Excel, it's ok if the columns of numbers are of unequal length, but leave missing or unobserved values blank--don't fill them in with 'NA' or '0' or '-99'. This app will fill them in with 'NA' after upload.",
           br(),
           br(),
           "For a paired t-test, each person or experimental unit must have a non-missing outcome value for each time point or replicate. Thus, the two columns of data must be of the same length. Additionally, they must be in the same order for the two columns with respect to people or experimental units. For instance, if the first observation in the first column came from a given person, the first observation in the second column must have come from that same person. While it wouldn't be used by our tool for its calculations, it might be useful to you to use an ID column that identifies people or experimental units. Then, all of the data in a given row should come from the person corresponding to the ID in that row.",
           br(), br() ) ) )) })
observeEvent(
  input$snip1b2,{ ##### Change this one every time
    showModal(
      modalDialog(
        tags$div(
          style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
          h3("Data"), ##### Change this one every time
          tags$iframe(
            width="1280", height="720",
            src = "snip1b2.mp4", ##### Change this one every time
            frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })




observeEvent(
  input$snip1c1,{ ##### Change this one every time
    showModal(
      modalDialog( 
        tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                  column(width = 12,
                         h3("Model Assumptions"), ##### Change this one every time and text below
                         "T-tests require that several assumptions be met to perform optimally. These include:", br(),br(),
                         "1) Independence of observations (partial or complete; see below)", br(),
                         "2) Normality of the outcome", br(),
                         "3) Equal variances/standard deviations in the two groups (only for Student's 2-sample t-test; see below)", br(),
                         h4("Independence of Observations"),
                         "A two-sample t-test assumes that all observations are independent of each other. A paired t-test assumes that all observations at a given time point or replicate are independent of each other, but allows for correlation between the two observations at the two time points/replicate values sampled on the same individual/experimental unit. So, a two-sample t-test assumes complete independence of observations, while a paired t-test allows partial correlation (lack of independence) in a structured, particular way. To do this, the paired t-testt needs to 'know' which observations come from the same person/experimental unit. In our case, it assumes the first observation given in the first column comes from the same person/experimental unit as the first observation given in the second column, etc. So make sure your observations are ordered the same in both columns with respect to person/experimental unit. The inclusion of a Subject ID column is recommended so you can remember and track this, though the ID column isn't actually used by our paired t-test tool. For the two-sample t-test, none of this is true--it doesn't 'care' about order in the two columns.",
                         h4("Normality of the Outcome"),
                         "A two-sample t-test also assumes that the sample means for the two groups are normally distributed, though the distributions for the two means can have different population means (and possibly different standard deviations; see below). The paired t-test assumes that the sample mean of the paired differences is normally distributed. One way for these sample means to be normally distributed is for the actually outcome in the sample to be normally distributed. In such a case, sample size doesn't matter (when it comes to normality). You can see histograms of the outcome values in the sample in the left column of the sample below. Another way for these sample means to be normally distributed is for the sample size to be large. According to the Central Limit Theorem, the distribution of the sample mean gets closer and closer to normal as the sample size increases, EVEN IF THE OUTCOME VALUES THEMSELVES AREN'T NORMALLY DISTRIBUTED. You can learn more about the Central Limit Theorem by taking a look at our 'Normality and the Central Limit Theorem' tool. In the columns of histograms on the t-test pages, the column on the right is what needs to be normal for the two-sample t-test, and the plot on the bottom right is what needs to be normal for the paired t-test.", br(), br(),
                         "There are tests for normality, but we don't use them here. We just examine the distributions with the histograms. This is because tests for normality further risk type I and type II errors, and are often underpowered. Additionally, t-tests are known to perform fairly well, even when the assumption of normality is violated. However, for gross departures from normality, one can turn to a non-parametric test as an alternative, or dichotomize or categorize your outcomes and use a contingency table test. The non-parametric equivalent of the two-sample t-test is the Wilcoxon rank-sum test, also known as the Mann-Whitney test, as it assumes your two groups are independent. The non-parametric equivalend of the paired t-test is the Wilcoxon signed-rank test, as it allows for paired/correlated observations at the two time points/replicate values. If you dichotomize your data and use a contingence table, you would use a chi-square or Fisher's exact test instead of a two-sample t-test, or a McNemar's test instead of a paired t-test.",
                         h4("Equality of Variances"),
                         "Equality of variances, equivalent to equality of standard deviations, is not relevant to a paired t-test, as it is effectively a one-sample t-test on the paired differences. Thus, there is only one variances or standard deviation to worry about. For a two-sample t-test, there is a variance for each of the two groups, so we could have two unequal variances. Student's t-test in its original form assumes equal variances in the two populations. Welch's t-test, also known as the unequal variances t-test, does not assume equal variances in the two groups. The t-test used here is Welch's t-test. While there are ways to test for equality of variances, those tests are not used here. This is because a test for equality of variances, like a test for normality or any other hypothesis test, risks both type I and type II errors, meaning there's some probability of incorrectly assuming equal variances. Additionally, Welch's t-test performs better than Student's t-test with unequal variances AND performs nearly as well as Student's t-test when the variances are equal. Because of this, we recommend against testing for equality of variances and recommend the use of Welch's t-test instead of Student's t-test in all cases. Note that Welch's t-test retains the other assumptions listed above.",
                         br(), br() ) ) )) })
observeEvent(
  input$snip1c2,{ ##### Change this one every time
    showModal(
      modalDialog(
        tags$div(
          style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
          h3("Model Assumptions"), ##### Change this one every time
          tags$iframe(
            width="1280", height="720",
            src = "snip1c2.mp4", ##### Change this one every time
            frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })



observeEvent(
  input$snip1d1,{ ##### Change this one every time
    showModal(
      modalDialog( 
        tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                  column(width = 12,
                         h3("Test Output"), ##### Change this one every time and text below
                         "The t-test itself gives a test-statistic value, called the t-value or just t, as can be seen in the 'Test Results' table. Paired with its degrees of freedom, or DF, which is calculated from the sample size, the t-test calculates a p-value. The p-value can be interpretted as 'the probability of observing our results or something more extreme if the null hympothesis is true'. So, the smaller the p-value, the less likely it is that the null hypothesis is true. We usually use a cut off of p<0.05 as the criteria to reject the null hypothesis.",
                         br(),
                         br(),
                         "In addition to the 'Test Results' table, there is an 'Estimates' table. Technically, the results in this table aren't part of the t-test, they're the estimates and confidence intervals we learned about previously. However, it's convention to report estimates and confidence intervals with the results of a test. So, we give those numbers in the 'Estimates' table below. These two tables are not tables that you would disseminate as is. However, results from both tables below will be combined and reported in the 'Tables and Figures for Publication.'",
                         br(), br() ) ) )) })
observeEvent(
  input$snip1d2,{ ##### Change this one every time
    showModal(
      modalDialog(
        tags$div(
          style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
          h3("Test Output"), ##### Change this one every time
          tags$iframe(
            width="1280", height="720",
            src = "snip1d2.mp4", ##### Change this one every time
            frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })




observeEvent(
  input$snip1e1,{ ##### Change this one every time
    showModal(
      modalDialog( 
        tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                  column(width = 12,
                         h3("Tables and Figures for Publication"), ##### Change this one every time and text below
                         "...temp...",
                         br(), br() ) ) )) })
observeEvent(
  input$snip1e2,{ ##### Change this one every time
    showModal(
      modalDialog(
        tags$div(
          style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
          h3("Tables and Figures for Publication"), ##### Change this one every time
          tags$iframe(
            width="1280", height="720",
            src = "snip1e2.mp4", ##### Change this one every time
            frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })




observeEvent(input$snip1f1,{
  showModal(modalDialog(
    tags$div(
      style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;",
      
      br(),
      column(width = 12,
             h3("Write up"),
             "The Statistical Methods section of a paper should included everything another statistician would need 
           to reproduce your results, minus the data. It should also be written in a way that non-statistician 
           scientists or clinicians can read and understand well, even if they're not familiar with all of the statistical 
           methods you used. The balance between statistical completeness and accessib8ility to a general sientific audience 
           can be tricky to attain. It may be easiest to start with statistical completeness, then revise your draft for clarity 
           and conciseness without losing completeness along the way. Something similar could be said for the results section.",
           br(),
           br(),
           "You may use multiple statistical methods in the same paper or poster. Each one should be included in the statistical 
           methods section. For each method, you should include several things:",
           br(),
           br(),
           "1) The name of the method (be specific)",
           br(),
           "2) What you did with the method (could be written as what the method did)",
           br(),
           "3) The 'input parameters' or 'settings' used",
           br(),
           "4) The assumptions made and how they were evaluated, if they were",
           br(),
           "5) Possibly additional concerns addressed or steps taken (model selection, steps to correct distributional shape or functional form, etc.)",
           br(),
           br(),
           "Can you identify these pieces in the write up below?",
           br(),
           br(),
           em("An unequal-variances (Welch's) t-test compared mean BMI in the treatment group to that of 
       the control group using a two-tailed type I error rate of \u03B1 = 0.05. The distributional assumption of 
       normality was examined graphically using histograms."),
       br(),
       br(),
       "Many of the above statements about a methods write-up apply to the results write-up as well. In addition, one must be careful 
           to give results according to the journal's requirements. For instance, the number of decimal places required when reporting 
           different results can differ from journal to journal. Some journals require the reporting of the test statistic value 
           (the value for 't' in the 'Test Results' table above). These requirements should be available on the journal's website. Additionally, 
           one must pay attention to tables, figures, and the text of the results section. All of the results should be reported somewhere, 
           and should all be addressed in the statistical methods section. However, it's possible to leave some results out of the text and 
           just refer the reader to a table, especially when the results aren't of particular interest because they weren't statistically 
           significant or clinically relevant. For instance, one might write, '...all other comparisons did not achieve statistical significance 
           (all p > 0.05). See Table 3 for complete results.'",
       br(),
       br(),
       "There are several pieces that should be reported in a complete write-up of the results for a model or test. These are:",
       br(),
       br(),
       "1) One or more estimates (means, differences in means, proportions, percentages, odds ratios, etc.)",
       br(),
       "2) Confidence intervals for each estimate above (sometimes standard errors are substituted for confidence intervals)",
       br(),
       "3) P-values (sometimes accompanied by the associated test statistic value, such as a t/F/chi-square value)",
       br(),
       "4) A decision about the hypothesis (was/wasn't significant, reject/fail to reject the null hypothesis)",
       br(),
       br(),
       "Can you identify these components in the 'Example Results' write-up below?",
       br(),
       br(),
       em("The mean BMI in the control group was 31.56 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          30.6 kg/m",tags$sup("2")," to 32.52 kg/m",tags$sup("2"),". In the treatment group, the mean was
          27.83 kg/m",tags$sup("2"),", with a 95% confidence interval of 
          26.83 kg/m",tags$sup("2")," to 28.82 kg/m",tags$sup("2"),". Mean BMI differed significantly between the 
          two groups (p<0.0001), as the treatment group mean was 3.73 kg/m",tags$sup("2")," lower than the control 
          group mean, with a 95% confidence interval of 1.82 kg/m",tags$sup("2")," lower to 5.64 kg/m",tags$sup("2")," lower."),
       br(),
       br(),
      )
      
    )
  ))
})

observeEvent(input$snip1f2,{
  showModal(modalDialog(
    tags$div(
      style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
      h3("Write-Up"),
      tags$iframe(
        width="1280",
        height="720",
        src = "snip1f2.mp4",
        #src = "video6i.pdf",
        frameborder="0", 
        allow="accelerometer; autoplay; encrypted-media; gyroscope; 
                                               picture-in-picture", 
        allowfullscreen=NA
      ),
      br(),
      br(),
      
    )
  ))
})



observeEvent(
  input$snip1g1,{ ##### Change this one every time
    showModal(
      modalDialog( 
        tags$div( style = "height: 150px; background-color: #FFFFFF; width: 600px; position: relative; right:0;", br(), 
                  column(width = 12,
                         h3("Saving your Work Reproducibly"), ##### Change this one every time and text below
                         "Always save your work, and do it in a reproducible way. This means that, if someone needed to reproduce your results, you could simply give them one or more files (that's what you're saving here) and tell them what analysis program or language or tool you used, and they'd be able to reproduce your results exactly. This is helpful if someone challenges your work or you get audited. It's also helpful if you leave an institution, corporation, or clinic and someone there needs to reproduce your results at some point. But it's probably most useful for you. There are any number of reasons you might need to reproduce your owwn results for yourself, such as when you need to pick up where you left off the last time you worked on your analysis.",
                         br(), br() ) ) )) })
observeEvent(
  input$snip1g2,{ ##### Change this one every time
    showModal(
      modalDialog(
        tags$div(
          style = "height: 780px; background-color: #FFFFFF; width: 1280px; position: relative; right:0;",
          h3("Saving your Work Reproducibly"), ##### Change this one every time
          tags$iframe(
            width="1280", height="720",
            src = "snip1g2.mp4", ##### Change this one every time
            frameborder="0", allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture", allowfullscreen=NA ), br(), br() ) )) })





