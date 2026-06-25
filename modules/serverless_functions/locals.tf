locals {
    functions = {
        data_reader = {
            function_name = "${var.environment}-dr"
            filename      = "${path.module}/lambda/data-reader.zip"
            #source_code_hash = filebase64sha256("${path.module}/lambda/data-reader.zip")
            template = {
                vpc_config = {} #this is the equivalent of the "true" boolean
                environment = {}
            }
        }
        data_writer = {
            function_name = "${var.environment}-dw"
            filename      = "${path.module}/lambda/data-writer.zip"
            #source_code_hash = filebase64sha256("${path.module}/lambda/data-writer.zip")
            template = {
                vpc_config = {}
                environment = {}
            }
        }
        data_driver = {
            function_name    = "${var.environment}-dd"
            filename         = "${path.module}/lambda/data-driver.zip"
            #source_code_hash = filebase64sha256("${path.module}/lambda/data-driver.zip")
            template = {
                vpc_config = null
                environment = null
            }
        }
    }
}
