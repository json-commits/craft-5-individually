script.on_event('individual-craft-5', function(event)
    local selected_prototype = event.selected_prototype
    if selected_prototype then
        if selected_prototype.base_type == "recipe" then
            local plr = game.players[event.player_index]
            for _ =1, 5, 1 do
                plr.begin_crafting{count=1, recipe=selected_prototype.name, silent=true}
            end
            global.crafting_5 = true
        end
    end
end)

script.on_event(defines.events.on_pre_player_crafted_item, function(event)
    if global.crafting_5 then
        local plr = game.players[event.player_index]
        plr.cancel_crafting{index=plr.crafting_queue_size, count=5}
        global.crafting_5 = false
    end
end)