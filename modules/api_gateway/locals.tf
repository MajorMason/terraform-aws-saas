locals {
    api_routes = {
        reader_route = {
            route_key = var.reader_route_key
        }
        writer_route = {
            route_key = var.writer_route_key
        }
        driver_route = {
            route_key = var.driver_route_key
        }
    }
    api_integrations = {
        reader_integration = {
            integration_type       = var.integration_type
            integration_uri        = var.reader_function_invoke
        }
        writer_integration = {
            integration_type       = var.integration_type
            integration_uri        = var.writer_function_invoke
        }
        driver_integration = {
            integration_type       = var.integration_type
            integration_uri        = var.driver_function_invoke
        }
    }
}
