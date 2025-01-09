#' @importFrom httr2 req_body_form req_perform_iterative req_url_path_append
#'     request resp_body_html signal_total_pages
#' @importFrom rlang `!!!`
#' @importFrom xml2 xml_find_all
NULL

webpost_url <- function() {
    getOption("TOPPCLUSTER_API_URL", "https://toppcluster.cchmc.org")
}

ITEMS_GENELIST <- c("symbolType", "name", "input", "genelist")

## POST data to submit genelists.
##
## Page 1 of 3 to obtain ToppCluster results.
req_data_genelist <- function(symbols_list) {
    stopifnot(is(symbols_list, "list"))
    stopifnot(length(symbols_list) > 1L)
    stopifnot(! is.null(names(symbols_list)))
    req_data <- vector(
        "list",
        length =
            length(symbols_list) *
            length(ITEMS_GENELIST))
    names(req_data) <-
        rep(ITEMS_GENELIST, times = length(symbols_list))
    ## FIXME: Using pre-collapsed list for now, but this should collapse the
    ## list.
    req_data[names(req_data) == "symbolType"] <- "HGNC"
    req_data[names(req_data) == "name"] <- names(symbols_list)
    req_data[names(req_data) == "input"] <- seq_along(symbols_list)
    req_data[names(req_data) == "genelist"] <- unlist(
        symbols_list, use.names = FALSE)
    not_input <- names(req_data) != "input"
    names(req_data)[not_input] <-
        paste0(
            names(req_data)[not_input],
            rep(
                seq_along(symbols_list),
                each = length(ITEMS_GENELIST[-3])))
    req_data
}

post_snapshot <- function() {
    ## A more robust, but labor intensive, way would be to extract the massive
    ## list of table "Feature", etc. form keys using the HTML because they may
    ## change over time.  The code below assumes the form POST matches the
    ## snapshot saved on January 2024.
    ##
    ## POST request extracted from Mozilla Firefox:
    file_post_raw <-
        system.file(
            "extdata",
            "post_settings.txt",
            package = "toppsuite",
            mustWork = TRUE)
    ## Convert to key-value list.
    post_raw <-
        readChar(file_post_raw, file.info(file_post_raw)$size) |>
        gsub(pattern = "\\n$", replacement = "") |>
        strsplit("&", fixed = TRUE) %>%
        unlist()
    post <-
        setNames(
            gsub(x = post_raw, "^.+=", ""),
            gsub(x = post_raw, "=.+$", ""))
    ## Default to returning all results.
    post["enrichment_limit"] <- "0"
    post
}

## Submit results filtering and processing settings.
##
## Page 2 of 3 to obtain ToppCluster results.
req_data_preview <- function(limit = NULL) {
    post <- post_snapshot()
    stopifnot(length(limit) == 1L)
    stopifnot(limit == "All" || is.integer(limit))
    if (limit != "All") {
        post["enrichment_limit"] <- as.character(limit)
    }
    as.list(post)
}

## TODO: This list of genes should be made accessible with data().
##
## Use the "Load Sample Data" 3 inputs of the https://toppcluster.cchmc.org/
## website.
sep <- "\r\n"
GENELIST1 <-
    paste(
        "SLC23A3", "DMGDH", "MGC10946", "ACSM2", "PANK1", "GLDC", "SLC23A1",
        "C10orf65", "KLHDC7A", "AQP2", "CLDN2", "GBA3", "LOC152573", "SLC4A4",
        "GCSH", "AS3MT", "HMFN0839", "HOXA9", "PART1", "HOXA3", "HABP2",
        "CUBN", "SLC6A19", "FLJ20581", "SLC34A1", "ENTPD5", "SERPINF2", "DHDH",
        "SLC6A13", "TM4SF5", "WDR72", "PDZK1", "UPB1", "FCAMR", "BTC", "ACE2",
        "SLC5A8", "RBP5", "C10orf62", "CLDN8", "BOLA3", "LOC441964", "HOXB8",
        "ATP6V0D2", "MGC5987", "FREM2", "SLC22A6", "ENPEP", "KLK1",
        "LOC153328", "HOXD1", "SLC22A2", "PRKRIP1", "PEX11A", "CLCNKB", "STC1",
        "UMOD", "SLC5A2", "ACMSD", "ADH6", "PKHD1", "CYP27B1", "FLRT3",
        "HOXC5", "HOXC4", "ARSF", "ATP6V0A4", "CHST13", "LOC400781", "PCK1",
        "HAO2", "ARSE", "TRPM6", "PPARGC1A", "HOXC6", "LOC148766", "MSR1",
        "NMB", "GLYATL1", "LOC442282", "GRTP1", "SLC10A2", "SLC16A12", "EAF2",
        "HSPA12B", "ACADSB", "BHMT", "ALDH6A1", "VNN1", "HAK", "FXYD4",
        "LOC441748", "FXYD2", "BRDG1", "PAH", "GIPC2", "NOX4", "HOXD4", "REN",
        "HOXD3", "TNFSF7", "MGC4677", "SLC22A8", "ZNF322B", "DZIP1", "SLC22A7",
        "HOXD9", "HOXD8", "ACY3", "DHRS10", "DPYS", "LOC388588", "LOC400951",
        "HNF4G", "SLC7A13", "MAWBP", "GPT", "KIF12", "TFCP2L1", "C6orf71",
        "CHRDL2", "C20orf75", "SLC6A3", "LOC344887", "MYOM3", "LFNG",
        "SULT1C1", "IMMP2L", "TRIM6", "LOC155006", "HNF4A", "TMEM46",
        "TRIM6-TRIM34", "HAVCR1", "TINAG", "RNF152", "MIOX", "MME", "BHMT2",
        "AVPR1A", "C20orf175", "ZFY", "LIME1", "ECRG4", "PAX2", "RHOB",
        "CLDN10", "IMMP1L", "PAX8", "SLC7A9", "TFEC", "LOC389332", "ANGPTL3",
        "RGN", "CLDN16", "DKFZP586D0919", "LOC388480", "SGK2", "DNASE1L3",
        "LRRC19", "PTGER1", "LOC388564", "PTGER2", "NR1I3", "PTGER3", "PAPLN",
        "AFM", "C20orf58", "NPL", "HOXD10", "CYP17A1", "PTD012", "FLJ90586",
        "FLJ31166", "SPP1", "MIST", "ATP6V1G3", "SLC17A1", "SLC17A3",
        "TMEM16D", "TM4SF18", "PKLR", "DMRT2", "NR1H4", "TMEM61", "FMO1",
        "BBOX1", "PDZK1IP1", "KIAA1161", "C9orf116", "C7orf29", "AGMAT",
        "GATM", "LOC440858", "MORN2", "SLCO4C1", "LOC440853", "LOC401164",
        "SLC28A1", "MUCDHL", "GALNT14", "DEFB1", "OGDHL", "HNMT", "CDH6",
        "ZNF81", "SALL1", "GRB14", "LOC340094", "SLC16A7", "SLC16A9", "ENPP3",
        "ENPP6", "STK32B", "LOC200230", "CARD10", "CASR", "UNC5CL", "G6PC",
        "HGD", "SLC30A2", "DIO1", "LOC285711", "PIPOX", "POU3F3", "SCNN1G",
        "EMCN", "MAF", "FLJ31196", "KUB3", "CHMP4A", "SLC27A2", "PVALB",
        "C14orf105", "LOC123876", "LOC440030", "NPR3", "SLC1A1", "PROZ",
        "GLYAT", "MRO", "KNG1", "FUT6", "IGSF22", "DPP4", "MGC13034", "TMEM27",
        "GPR110", "LOC440943", "DKFZp451M2119", "UGT3A1", "LOC388375", "KL",
        "MGAM", "MOSC2", "GGT6", "VCAM1", "AGXT2", "LOC285733", "BTBD5",
        "C1orf64", "ARHGAP24", "SLC2A9", "PTPRB", "NAT8", "DAO", "AMACR",
        "LHX1", "TMEM12", "SLC26A7", "TGFBI", "LOC440134", "TCF2", "RNF186",
        "MUC20", "LOC388383", "LOC440133", "NFE2L2", "KCNK5", "LOC440450",
        "GAL3ST1", "TREH", "ITGB3", "SLC2A2", "OSTbeta", "FTCD", "LOC134147",
        "CALB1", "SENP8", "CYP4V2", "UGT2A3", "MGC35366", "UPP2", "LOC348174",
        "LOC390940", "UNQ846", "HIBCH", "SLC13A1", "EMX1", "SLC13A2", "AMN",
        "EMX2", "SLC13A3", "SLC36A2", "PLA2G12B", "HSDL1", "IQCA", "LOC388630",
        "ABCC6", "HUNK", "LOC283177", "NDUFC1", "PRODH2", "KLF15", "CHDH",
        "EHHADH", "CDH16", "ASPA", "LOC374569", "UGT2B7", "RBKS", "TRIM55",
        "LOC441682", "C14orf149", "HCN3", "C14orf73", "DDC", "PRKAA2", "CEBPD",
        "DNAH5", "FGL2", "SLC5A11", "SLC5A12", "SLC3A1", "PLG", "LRP2",
        "SEMA3F", "CKMT2", "LOC87769", "CCL4", "AK3L1", "AK3L2", "MYCL1",
        "KCNJ1", "LOC441311", "TUB", "SLC12A3", "EGF", "LOC339025", "GZMA",
        "SLC12A1", "LOC387763", "KCNJ15", "KCNJ16", "SLC4A9", "NPHS2",
        "XPNPEP2", "C8orf72", "PTX3", "GALM", "FOLR3", "ALDH8A1", "",
        sep = sep)
GENELIST2 <-
    paste(
        "DMGDH", "ACSM2", "AQP9", "GAGE8", "SLC4A1", "C4BPA", "ABAT", "C4BPB",
        "C4B", "C4A", "LIPC", "FRAT2", "TDO2", "CYP2D6", "ZXDB", "HABP2",
        "SULT2A1", "GAMT", "SDS", "FLJ20581", "SERPINF2", "RNASE4", "HFE2",
        "TM4SF4", "FLJ14437", "UPB1", "SEPP1", "RBP4", "AZGP1", "TFR2",
        "AGTR1", "MT1G", "MT1H", "CYP2E1", "CES4", "HPD", "TRIM10", "SPANXA2",
        "SPANXA1", "LOC169355", "CES1", "SLC22A3", "CFH", "EPB42", "BF",
        "EBI2", "SLC22A1", "HPN", "MTTP", "C9orf76", "HPR", "A1BG", "ADH6",
        "C3", "ADH4", "HPX", "C5", "C6", "APOM", "CYP2B6", "CMYA3", "C9",
        "APOH", "JUB", "RDH16", "HAO1", "APOB", "A2M", "HAO2", "PPARGC1A",
        "FZD2", "ACF", "SLC10A1", "CYP4F2", "ABCA9", "NR0B2", "ACADSB",
        "FOSL1", "CYP2C9", "CYP2C8", "HAL", "TF", "BHMT", "PAH", "LOC401884",
        "F13B", "HRG", "SLC22A7", "SERPINA2", "SERPINA3", "ORM1", "SERPINA1",
        "DPYS", "SERPINA10", "C6orf192", "MAWBP", "C8B", "SERPINA6", "PCSK6",
        "FLJ13798", "SERPINA7", "C8A", "ORM2", "AREG", "ASGR1", "SERPINA4",
        "ASGR2", "KHK", "SERPINA5", "GYS2", "HBM", "C8G", "KCNT2", "LEAP-2",
        "HNF4A", "HBZ", "LOC442461", "MYBPC1", "AHSG", "ARG1", "BHMT2", "MST1",
        "BAAT", "F2", "DUSP9", "NR5A1", "LOC440837", "F9", "LOC440838",
        "NR5A2", "OAF", "IL1B", "ANGPTL3", "LOC400299", "ALDOB", "DNASE1L3",
        "CHST3", "APCS", "ADH1C", "SERPINC1", "ADH1B", "TMPRSS6", "ADH1A",
        "NR1I3", "SAA4", "AKR1D1", "NR1I2", "AFM", "LOC283587", "AFP",
        "HSD17B6", "COX5B", "FLJ14503", "CYP7A1", "CPN1", "HRSP12", "SPP2",
        "GC", "PKLR", "SERPIND1", "AKR1C1", "F12", "F11", "BCDO2", "NR1H4",
        "AKR1C3", "AKR1C2", "AKR1C4", "FMO3", "KRT10", "DHRS2", "FMO5", "AGT",
        "GNMT", "FABP1", "GFI1B", "GATM", "LRG1", "AADAC", "NEDD4", "GSTA2",
        "GSTA1", "NBR1", "SAA1", "SAA2", "RHAG", "KLKB1", "CRLF1", "IL18R1",
        "PLGLB2", "HP", "LOC388154", "NEK1", "UGT2B10", "G6PC", "HGD", "DIO1",
        "PIPOX", "MAT1A", "KCTD9", "CYB5", "COL4A4", "FETUB", "MASP2",
        "SLC27A5", "LOC123876", "CPB2", "NNMT", "LOC401106", "ABHD2", "PROZ",
        "GLYAT", "CYP2C18", "KNG1", "MTM1", "SPTA1", "SLCO1B1", "VTN",
        "SLCO1B3", "ZNF426", "FLJ21963", "SLC38A4", "CYP2J2", "AMBP", "AGXT2",
        "HPS3", "DCDC2", "FLJ10213", "INHBC", "VIL1", "PROC", "CPS1", "NAT2",
        "TMEM12", "ALB", "RFXAP", "LOC55908", "LZTR2", "PNLIPRP1", "LOC144631",
        "CXCL6", "ALAS2", "LOC387775", "TAT", "LECT2", "PZP", "SLC2A2",
        "CXCL2", "ADRA1A", "AOX1", "LBP", "HMGCS2", "OIT3", "KIAA1429", "FGB",
        "FGA", "ABCC2", "CYP3A43", "FGG", "APOA2", "APOA1", "CYP2A7", "CYP2A6",
        "SLC25A18", "ZNF517", "IL1RAPL2", "EHHADH", "PAPD5", "LOC286327",
        "UGT2B4", "CFHL2", "ANG", "C14orf37", "CFHL1", "AGXT", "CFHL3", "CRP",
        "HEMGN", "ITIH4", "PON3", "ITIH3", "COLEC10", "ITIH2", "LOC442096",
        "FGL1", "PON1", "PLG", "CYP3A4", "ITIH1", "CYP3A5", "CYP3A7", "CRYZ",
        "RAB26", "SLC13A5", "C14orf68", "APOC4", "APOC3", "FIS", "UROC1",
        "APOC2", "CTH", "APOC1", "CD7", "GAGE7", "POLR3G", "GAGE4", "ALDH8A1",
        "GAGE2", "GAGE1", "", sep = sep)
GENELIST3 <-
    paste(
        "PRSS1", "AMY2A", "FLJ23322", "GOLT1A", "REG1B", "LOC441181", "FBXO27",
        "REG1A", "TSEN2", "SLC8A2", "HLXB9", "SCGN", "KRTCAP3", "C1orf127",
        "LOC441213", "PRSS3", "PRSS2", "ZNF565", "MGC42090", "RGS9", "C3orf14",
        "CHGB", "LOC440361", "CPA2", "PDIA2", "CPA1", "SLC30A8", "SPINK1",
        "ENTPD3", "FAM24B", "AMY1B", "NPFF", "CTRB1", "AMY1C", "ENTPD8",
        "DYRK1B", "KCNK16", "CEL", "TM4SF4", "FLJ14712", "IPF1", "ADCYAP1",
        "RBP7", "CLPS", "SGNE1", "FLJ45909", "IL23A", "SFRP5", "KIAA1456",
        "LOC389772", "LY6D", "IAPP", "SCG2", "PNLIP", "C21orf62", "MGC50559",
        "CFTR", "CPB1", "BEX1", "KLK1", "LOC253012", "GIPR", "LOC387950",
        "LOC145788", "ARX", "LOC388807", "LOC150297", "REG3G", "NID1", "CUZD1",
        "TIMM50", "NEUROD1", "MGC42630", "PCSK1N", "NPC1L1", "CDH22", "PPY",
        "NPTX2", "NTSR1", "NKX2-2", "SYT5", "LOC388538", "GP2", "SLC16A12",
        "TDRD9", "LOC93556", "MAFA", "G6PC2", "PLCXD3", "MAFB", "CTRL",
        "PPP1R1A", "DPCR1", "SYCN", "FEV", "SERPINI2", "CPE", "SLC26A9",
        "SIM1", "CNIH2", "CTRC", "C11orf11", "TSGA2", "PNLIPRP1", "PCSK2",
        "PNLIPRP2", "PCSK1", "HSPB9", "LOC388227", "ERO1LB", "SLC44A4",
        "C14orf50", "FLJ20130", "ELA3B", "LOC339453", "ELA3A", "LOC285501",
        "SERPINA4", "DKFZp761L1417", "UCN3", "ITGB6", "CTSE", "TMED6",
        "RFXDC1", "TIGD1", "LOC402626", "APOBEC2", "CHST7", "PLEKHG2", "EDN3",
        "ABCC8", "LOC401778", "ELA2A", "PAX6", "TNRC4", "MUC5AC", "C1QL1",
        "LOC345630", "VGF", "CDC42EP4", "VWA1", "LOC389174", "ATG4D",
        "FLJ31846", "PLA2G1B", "GPR44", "TUBD1", "KCNA5", "NLF1", "LOC400617",
        "NLF2", "INS", "LOC133993", "KIAA0514", "TTR", "LOC442529", "C10orf95",
        "LOC440743", "PCBD1", "RABAC1", "LOC442126", "PAK3", "NDUFA8",
        "LOC401434", "TMEM61", "SYT16", "GAD2", "GCG", "RBPSUHL", "MUC5B",
        "PLEKHA9", "CFC1", "PLEKHA8", "MGC10471", "SST", "ASB9", "INSM1",
        "SSBP1", "CDK5R2", "CRB3", "", sep = sep)

## Submit genelists.
##
## Page 1 of 3 to obtain ToppCluster results.
cluster_request1 <- function(req_data) {
    request(webpost_url()) |>
        req_url_path_append("CheckGenes") |>
        req_body_form(!!!req_data)
}

cluster_request2 <- function(id, req_data) {
    request(webpost_url()) |>
        ## Encode the unusual URL.
        (function(x) {
            x$url <- file.path(x$url, "preview.jsp?id=", id)
            x
        })() |>
        req_body_form(!!!req_data)
}

cluster_request3 <- function(id, req_data) {
    request(webpost_url()) |>
        ## Encode the unusual URL.
        (function(x) {
            x$url <- file.path(x$url, "ProcessInput?", id)
            x
        })() |>
        req_body_form(!!!req_data)
}

cluster_next_request <- function(resp, req) {
    signal_total_pages(3L)
    next_req <- NULL
    if (basename(resp$request$url) == "CheckGenes") {
        ## Submit results filtering and processing settings.
        ##
        ## Page 2 of 3 to obtain ToppCluster results.
        limit <- attr(resp$request, "limit")
        stopifnot(! is.null(limit))
        req_data <- req_data_preview(limit)
        id <- basename(resp$url)
        next_req <- cluster_request2(id, req_data)
    } else if (strtrim(
                   basename(resp$request$url),
                   nchar("preview.jsp")) == "preview.jsp" ||
                   grepl("standardHTML", resp$url)) {
        ## Final results (hopefully)!
        ##
        ## Page 3 of 3 (hopefully) containing final ToppCluster results.
        next_req <-
            request(webpost_url()) |>
            req_url_path_append("standardHTML") |>
            req_url_path_append(id)
        message("Reached results page, probably.")
    } else {
        warning(
            "Unhandled page encountered!\n",
            "Try to retrieve results using ID.")
    }
    next_req
}

cluster_responses <- function(symbols_list, limit = NULL, progress = TRUE) {
    if (is.null(limit)) {
        limit <- "All"
    }
    ## Hacky way of embedding attr() data to be accessible by next_req in
    ## req_perform_iterative(..., next_req) for run subsequent POST requests.
    req <- cluster_request1(req_data_genelist(symbols_list))
    attr(req, "limit") <- limit
    req_perform_iterative(
        req,
        cluster_next_request,
        on_error = "return",
        progress = progress)    
}

#' Return functional enrichment of genesets.
#'
#' The ToppCluster API returns many [CATEGORIES] of geneset erichment.
#'
#' @param symbols List of character vectors of genes.
#' @return DataFrame with 15 columns containing the enrichment Category, ID,
#'     and associated data.
#' @export
#' @examples
#' # ToppCluster website sample data functional enrichment call:
#' cluster(list(Kidney = GENELIST1, Liver = GENELIST2, Pancreas = GENELIST3))
cluster <- function(symbols_list, limit = NULL, progress = TRUE) {
    cluster_responses(symbols_list, limit, progress)
    ## browser()
    ## html <-
    ##     tail(responses, 1)[[1]] |>
    ##     resp_body_html()
    ## ## TODO: xml2::xml_find_all HTML processing into DataFrame().
    ## DataFrame()
}
