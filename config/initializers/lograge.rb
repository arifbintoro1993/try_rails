Rails.application.configure do
    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Logstash.new
    config.lograge.custom_options = lambda do |event|
        exceptions = %w(controller action format utf8)
        masked_params = %w(address)

        params = event.payload[:params].dup
        params.slice(*masked_params).each { |k, v| params[k] = "MASKED" }

        payload = {
        params: params.except(*exceptions).to_s,
        }.merge(event.payload.slice(
                :current_user,
                :host_ip,
                :ip_address,
                :referer_host,
                :referer_path,
                :request_bl_service,
                :request_id,
                :tags,
                :user_agent
        ))

        return payload if ENV['BACKTRACE_ENABLED'] != 'true'

        if event.payload[:exception].present?
        exception = event.payload[:exception]
        payload[:error] = "#{exception.class.name}: #{exception.message}"

        backtrace_depth = (ENV['BACKTRACE_DEPTH'] || 20).to_i
        payload[:error_backtrace] = exception.backtrace.take(backtrace_depth).join("\n")
        end

        payload
    end
end