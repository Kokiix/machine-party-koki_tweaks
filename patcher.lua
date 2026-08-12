local function randomize_spine_breaker_timer()
    local min_time = GDPatch.get_config_option(nil, "randomized_spinebreaker", "min_time")
    local max_time = GDPatch.get_config_option(nil, "randomized_spinebreaker", "max_time")

    GDPatch.patch_script_as_text("minigames/spine_breaker/components/device/spine_breaker_device.gdc", function(context, src)
        src = src:gsub("func start_timer%(%):", function()
            return 
            
    [[
    func start_timer():
        activation_duration = ]] .. string.format("randf_range(%d, %d)", min_time, max_time)

        end)
        return src
    end)
end

randomize_spine_breaker_timer()