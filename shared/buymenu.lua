class 'BuyMenu'
class 'BuyMenuEntry'

function BuyMenuEntry:__init( model_id, price, entry_type )
    self.model_id = model_id
    self.price = price
    self.entry_type = entry_type
end

function BuyMenuEntry:GetPrice()
    return self.price/10
end

function BuyMenuEntry:GetModelId()
    return self.model_id
end

function BuyMenuEntry:GetListboxItem()
    return self.listbox_item
end

function BuyMenuEntry:SetListboxItem( item )
    self.listbox_item = item
end

class 'VehicleBuyMenuEntry' (BuyMenuEntry)

function VehicleBuyMenuEntry:__init( model_id, price )
    BuyMenuEntry.__init( self, model_id, price, 1 )
end

function VehicleBuyMenuEntry:GetName()
    return Vehicle.GetNameByModelId( self.model_id )
end

class 'WeaponBuyMenuEntry' (BuyMenuEntry)

function WeaponBuyMenuEntry:__init( model_id, price, slot, name )
    BuyMenuEntry.__init( self, model_id, price, 2 )
    self.slot = slot
    self.name = name
end

function WeaponBuyMenuEntry:GetSlot()
    return self.slot
end

function WeaponBuyMenuEntry:GetName()
    return self.name
end

class 'ModelBuyMenuEntry' (BuyMenuEntry)

function ModelBuyMenuEntry:__init( model_id, price, name )
    BuyMenuEntry.__init( self, model_id, price, 2 )
    self.name = name
end

function ModelBuyMenuEntry:GetName()
    return self.name
end

function BuyMenu:CreateItems()
    self.types = {
        ["Vehicle"] = 1,
        ["Weapon"] = 2,
        ["Model"] = 3
    }

    self.id_types = {}

    for k, v in pairs(self.types) do
        self.id_types[v] = k
    end
    self.items = {
        [self.types.Vehicle] = {
            { "Bike", "Car", "Sportcar", "Jeep", "Pickup", "Bus", "Truck", "Heavy", "Tractor", "Heli", "Plane", "Boat"},

			["Bike"] = {
				VehicleBuyMenuEntry( 9, 100 ),
				VehicleBuyMenuEntry( 22, 100 ),
				VehicleBuyMenuEntry( 47, 100 ),
				VehicleBuyMenuEntry( 83, 100 ),
				VehicleBuyMenuEntry( 32, 100 ),
				VehicleBuyMenuEntry( 90, 400 ),
				VehicleBuyMenuEntry( 61, 400 ),
				VehicleBuyMenuEntry( 89, 500 ),
				VehicleBuyMenuEntry( 43, 500 ),
				VehicleBuyMenuEntry( 74, 600 ),
				VehicleBuyMenuEntry( 21, 900 ),
				--also Shimuzu Trackline
				--VehicleBuyMenuEntry( 11, 250 ),
				--and next one
				VehicleBuyMenuEntry( 36, 250 )
			},

			["Car"] = {
				VehicleBuyMenuEntry( 44, 500 ),
				VehicleBuyMenuEntry( 29, 500 ),
				VehicleBuyMenuEntry( 15, 500 ),
				VehicleBuyMenuEntry( 70, 500 ),
				VehicleBuyMenuEntry( 55, 700 ),
				VehicleBuyMenuEntry( 13, 800 ),
				VehicleBuyMenuEntry( 54, 1500 ),
				VehicleBuyMenuEntry( 8, 3000 )
					
			},

			["Sportcar"] = {
				VehicleBuyMenuEntry( 78, 1000 ),
				VehicleBuyMenuEntry( 2, 1000 ),
				VehicleBuyMenuEntry( 91, 1200 ),
				VehicleBuyMenuEntry( 35, 1500 )
			},

			["Jeep"] = {
				VehicleBuyMenuEntry( 48, 700 ),
				VehicleBuyMenuEntry( 87, 700 ),
				VehicleBuyMenuEntry( 52, 750 ),
				VehicleBuyMenuEntry( 46, 800 ),
				VehicleBuyMenuEntry( 72, 900 ),
				VehicleBuyMenuEntry( 84, 2000 ),
				VehicleBuyMenuEntry( 77, 2500 )
			},

			["Pickup"] = {
				VehicleBuyMenuEntry( 60, 500 ),
				VehicleBuyMenuEntry( 26, 500 ),
				VehicleBuyMenuEntry( 73, 500 ),
				VehicleBuyMenuEntry( 23, 500 ),
				VehicleBuyMenuEntry( 63, 500 ),	
				VehicleBuyMenuEntry( 68, 500 ),				
				VehicleBuyMenuEntry( 33, 500 ),
				VehicleBuyMenuEntry( 86, 800 ),
				VehicleBuyMenuEntry( 7, 1500 )
			},

			["Bus"] = {
				VehicleBuyMenuEntry( 66, 700 ),
				VehicleBuyMenuEntry( 12, 1000 )
			},

			["Truck"] = {
				VehicleBuyMenuEntry( 42, 600 ),
				VehicleBuyMenuEntry( 49, 600 ),
				VehicleBuyMenuEntry( 71, 600 ),
				VehicleBuyMenuEntry( 41, 600 ),
				VehicleBuyMenuEntry( 4, 750 ),
				VehicleBuyMenuEntry( 79, 1200 )
			},

			["Heavy"] = {
				VehicleBuyMenuEntry( 40, 1500 ),
				VehicleBuyMenuEntry( 31, 1500 ),
				VehicleBuyMenuEntry( 76, 2000 ),
				VehicleBuyMenuEntry( 18, 5000 ),
				VehicleBuyMenuEntry( 56, 5000 )
			},

			["Tractor"] = {
				VehicleBuyMenuEntry( 1, 100 )
			},

			["Boat"] = {
				VehicleBuyMenuEntry( 38, 300 ),
				VehicleBuyMenuEntry( 5, 300 ),
				VehicleBuyMenuEntry( 6, 300 ),
				VehicleBuyMenuEntry( 19, 500 ),
				VehicleBuyMenuEntry( 45, 600 ),
				VehicleBuyMenuEntry( 16, 600 ),
				VehicleBuyMenuEntry( 25, 300 ),
				VehicleBuyMenuEntry( 28, 900 ),
				VehicleBuyMenuEntry( 50, 800 ),
				VehicleBuyMenuEntry( 80, 1000 ),
				VehicleBuyMenuEntry( 27, 1200 ),
				VehicleBuyMenuEntry( 88, 1500 ),
				VehicleBuyMenuEntry( 69, 2000 )
			},

			["Heli"] = {
				VehicleBuyMenuEntry( 3, 3000 ),
				VehicleBuyMenuEntry( 14, 3000 ),
				VehicleBuyMenuEntry( 67, 3000 ),
				VehicleBuyMenuEntry( 37, 4000 ),
				VehicleBuyMenuEntry( 57, 4000 ),
				VehicleBuyMenuEntry( 64, 4000 ),
				VehicleBuyMenuEntry( 65, 4000 )
			},
			
			["Plane"] = {
				VehicleBuyMenuEntry( 59, 3000 ),
				VehicleBuyMenuEntry( 81, 5000 ),
				VehicleBuyMenuEntry( 51, 6000 ),
				VehicleBuyMenuEntry( 30, 8000 ),
				VehicleBuyMenuEntry( 34, 10000 ),
				VehicleBuyMenuEntry( 85, 12000 ),
				VehicleBuyMenuEntry( 39, 15000 )
			},
			
	},

        [self.types.Weapon] = {
            { "One-handed", "Two-handed" },
            ["One-handed"] = {
                WeaponBuyMenuEntry( Weapon.Handgun, 500, 1, "Pistol" ),
                WeaponBuyMenuEntry( Weapon.Revolver, 1000, 1, "Revolver" ),
                WeaponBuyMenuEntry( Weapon.SMG, 1200, 1, "SMG" ),
                WeaponBuyMenuEntry( Weapon.SawnOffShotgun, 1100, 1, "Sawn-off Shotgun" ),
				WeaponBuyMenuEntry( Weapon.BubbleGun, 5000, 1, "Bubble Gun Slot 1" ),
				WeaponBuyMenuEntry( Weapon.BubbleGun, 5000, 2, "Bubble Gun Slot 2")
            },

            ["Two-handed"] = {
			WeaponBuyMenuEntry( Weapon.Assault, 2000, 2, "Assault Rifle" ),
			WeaponBuyMenuEntry( Weapon.Shotgun, 2000, 2, "Shotgun" ),
			WeaponBuyMenuEntry( Weapon.MachineGun, 4000, 2, "Machine Gun" ),
			WeaponBuyMenuEntry( Weapon.Sniper, 5000, 2, "Sniper Rifle" ),
			WeaponBuyMenuEntry( Weapon.GrenadeLauncher, 6000, 2, "Grenade Launcher" ),
			WeaponBuyMenuEntry( Weapon.RocketLauncher, 7500, 2, "Rocket Launcher" ),
			WeaponBuyMenuEntry( Weapon.PanayRocketLauncher, 20000, 2, "Panay Rocket Launcher" ),
			WeaponBuyMenuEntry( Weapon.Minigun, 15000, 2, "Minigun" )
            },
			
        },

        [self.types.Model] = {
            { "Roaches", "Ular Boys", "Reapers", "Government", "Agency", "Misc" },

            ["Roaches"] = {
                ModelBuyMenuEntry( 2, 0, "Razak Razman" ),
                ModelBuyMenuEntry( 5, 0, "Elite" ),
                ModelBuyMenuEntry( 32, 0, "Technician" ),
                ModelBuyMenuEntry( 85, 0, "Soldier 1" ),
                ModelBuyMenuEntry( 59, 0, "Soldier 2" )
            },

            ["Ular Boys"] = {
                ModelBuyMenuEntry( 38, 0, "Sri Irawan" ),
                ModelBuyMenuEntry( 87, 0, "Elite" ),
                ModelBuyMenuEntry( 22, 0, "Technician" ),
                ModelBuyMenuEntry( 27, 0, "Soldier 1" ),
                ModelBuyMenuEntry( 103, 0, "Soldier 2" )
            },

            ["Reapers"] = {
                ModelBuyMenuEntry( 90, 0, "Bolo Santosi" ),
                ModelBuyMenuEntry( 63, 0, "Elite" ),
                ModelBuyMenuEntry( 8, 0, "Technician" ),
                ModelBuyMenuEntry( 12, 0, "Soldier 1" ),
                ModelBuyMenuEntry( 58, 0, "Soldier 2" ),
            },

            ["Government"] = {
                ModelBuyMenuEntry( 74, 0, "Baby Panay" ),
                ModelBuyMenuEntry( 67, 0, "Burned Baby Panay" ),
                ModelBuyMenuEntry( 101, 0, "Colonel" ),
                ModelBuyMenuEntry( 3, 0, "Demo Expert" ),
                ModelBuyMenuEntry( 98, 0, "Pilot" ),
                ModelBuyMenuEntry( 42, 0, "Black Hand" ),
                ModelBuyMenuEntry( 44, 0, "Ninja" ),
                ModelBuyMenuEntry( 23, 0, "Scientist" ),
                ModelBuyMenuEntry( 52, 0, "Soldier 1" ),
                ModelBuyMenuEntry( 66, 0, "Soldier 2" ) 
            },

            ["Agency"] = {
                ModelBuyMenuEntry( 9, 0, "Karl Blaine" ),
                ModelBuyMenuEntry( 65, 0, "Jade Tan" ),
                ModelBuyMenuEntry( 25, 0, "Maria Kane" ),
                ModelBuyMenuEntry( 30, 0, "Marshall" ),
                ModelBuyMenuEntry( 34, 0, "Tom Sheldon" ),
                ModelBuyMenuEntry( 100, 0, "Black Market Dealer" ),
                ModelBuyMenuEntry( 83, 0, "White Tiger" ),
                ModelBuyMenuEntry( 51, 0, "Rico Rodriguez" )
            },

            ["Misc"] = {
                ModelBuyMenuEntry( 70, 0, "General Masayo" ),
                ModelBuyMenuEntry( 11, 0, "Zhang Sun" ),
                ModelBuyMenuEntry( 84, 0, "Alexander Mirikov" ),
                ModelBuyMenuEntry( 19, 0, "Chinese Businessman" ),
                ModelBuyMenuEntry( 36, 0, "Politician" ),
                ModelBuyMenuEntry( 78, 0, "Thug Boss" ),
                ModelBuyMenuEntry( 71, 0, "Saul Sukarno" ),
                ModelBuyMenuEntry( 79, 0, "Japanese Veteran" ),
                ModelBuyMenuEntry( 96, 0, "Bodyguard" ),
                ModelBuyMenuEntry( 80, 0, "Suited Guest 1" ),
                ModelBuyMenuEntry( 95, 0, "Suited Guest 2" ),
                ModelBuyMenuEntry( 60, 0, "Race Challenge Girl" ),
                ModelBuyMenuEntry( 15, 0, "Male Stripper 1" ),
                ModelBuyMenuEntry( 17, 0, "Male Stripper 2" ),
                ModelBuyMenuEntry( 86, 0, "Female Stripper" ),
                ModelBuyMenuEntry( 16, 0, "Panau Police" ),
                ModelBuyMenuEntry( 18, 0, "Hacker" ),
                ModelBuyMenuEntry( 64, 0, "Bom Bom Bohilano" ),
                ModelBuyMenuEntry( 40, 0, "Factory Boss" ),
                ModelBuyMenuEntry( 1, 0, "Thug 1" ),
                ModelBuyMenuEntry( 39, 0, "Thug 2" ),
                ModelBuyMenuEntry( 61, 0, "Soldier" ),
                ModelBuyMenuEntry( 26, 0, "Boat Captain" ),
                ModelBuyMenuEntry( 21, 0, "Paparazzi" ),
            }
        }
    }
end

