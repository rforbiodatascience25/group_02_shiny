library("shiny")
library("bslib")

# Load needed functions
source(file = "app_functions.R")

server <- function(input, output) {
  dna <- reactive({
    gene_dna(length = input$n_bases, base_probs = c(input$prob_A, input$prob_T, input$prob_C, input$prob_G))
  })
  rna <- reactive({
    transcribe_dna(dna())
  })
  output$dna <- renderText({
    dna()
  })
  output$rna <- renderText({
    rna()
  })
  output$protein <- renderText({
    translate_rna(rna())
  })
  output$freqs <- renderTable({
    base_freqs(dna())
  })
}