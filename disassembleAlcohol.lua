-- dofile "bin/x64/plugins/cyber_engine_tweaks/scripts/disassembleAlcohol.lua"

-- Gets count of alcohol in backpack, removes and gives count*mat in return

commonMaterialAmount = 5 -- 6 if Mechanic perk is unlocked
UncommonMaterialAmount = 2 -- 3 if Mechanic perk is unlocked

alcohol = {
"Items.LowQualityAlcohol1",
"Items.LowQualityAlcohol2",
"Items.LowQualityAlcohol3",
"Items.LowQualityAlcohol4",
"Items.LowQualityAlcohol5",
"Items.LowQualityAlcohol6",
"Items.LowQualityAlcohol7",
"Items.LowQualityAlcohol8",
"Items.LowQualityAlcohol9",
"Items.MediumQualityAlcohol1",
"Items.MediumQualityAlcohol2",
"Items.MediumQualityAlcohol3",
"Items.MediumQualityAlcohol4",
"Items.MediumQualityAlcohol5",
"Items.MediumQualityAlcohol6",
"Items.MediumQualityAlcohol7",
"Items.GoodQualityAlcohol1",
"Items.GoodQualityAlcohol2",
"Items.GoodQualityAlcohol3",
"Items.GoodQualityAlcohol4",
"Items.GoodQualityAlcohol5",
"Items.GoodQualityAlcohol6",
"Items.NomadsAlcohol1",
"Items.NomadsAlcohol2",
"Items.TopQualityAlcohol1",
"Items.TopQualityAlcohol2",
"Items.TopQualityAlcohol3",
"Items.TopQualityAlcohol4",
"Items.TopQualityAlcohol5",
"Items.TopQualityAlcohol6",
"Items.TopQualityAlcohol7"
}

ts = Game.GetTransactionSystem()
player = Game.GetPlayer()
TotalAlcohol = 0 

for alcoholCount = 1, #alcohol do
    tid = TweakDBID.new(alcohol[alcoholCount]) 
    itemid = ItemID.new(tid)
    quantity = ts:GetItemQuantity(player,itemid)
    TotalAlcohol = TotalAlcohol + quantity --append to total
    ts:RemoveItemByTDBID(player, tid, quantity) --remove all of the type
end
print("Total Alcohol in inventory: " .. tostring(TotalAlcohol))


-- Add common mat to inventory 
CommonMaterial1 = ItemID.new(TweakDBID.new("Items.CommonMaterial1"))
result = ts:GiveItem(player, CommonMaterial1, commonMaterialAmount*TotalAlcohol)
if result then
    print("Obtained " .. tostring(5*TotalAlcohol) .. " Common Item Componets")
else
    print("Failed to obtained " .. tostring(commonMaterialAmount*TotalAlcohol) .. " Common Item Componets")
end

-- Add uncommon mat to inventory 
UncommonMaterial1 = ItemID.new(TweakDBID.new("Items.UncommonMaterial1"))
result = ts:GiveItem(player, UncommonMaterial1, UncommonMaterialAmount*TotalAlcohol)
if result then
    print("Obtained " .. tostring(2*TotalAlcohol) .. " Uncommo Item Componets")
else
    print("Failed to obtained " .. tostring(UncommonMaterialAmount*TotalAlcohol) .. " Uncommo Item Componets")
end
