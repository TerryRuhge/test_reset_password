# frozen_string_literal: true
# Member.create!([
#   {member_id: 1, is_admin: nil, is_supervisor: nil, leaderboard_points: nil, email: "joseph.shumway@tamu.edu", encrypted_password: "$2a$12$Mc.Gfl4OSwYRADexF720/uqJu157NbYKp4qD3KPCuQykmV/h6VSsK", full_name: "Joseph Shumway", uid: "106983132906341305923", avatar_url: "https://lh3.googleusercontent.com/a/ALm5wu22RVOzWn4-dNEd_0YOdkoB356ffv1WNv2miZfv=s96-c", provider: "google_oauth2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil},
#   {member_id: 3, is_admin: nil, is_supervisor: nil, leaderboard_points: nil, email: "trusty@stevens.com", encrypted_password: "$2a$12$rHDBXHTnxdzi.QQ9GKriheGBfLEnJ1g6yoks94nnw3rpJ.WFVrpdO", full_name: nil, uid: nil, avatar_url: nil, provider: nil, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil}
# ])
# Assignment.create!([
#   {assignment_id: 1, request_id: 1, driver_id: 0, driver_notes: nil, pick_up_time: nil, drop_off_time: nil, queue_pos: 0},
#   {assignment_id: 2, request_id: 2, driver_id: 0, driver_notes: "Heading north", pick_up_time: nil, drop_off_time: nil, queue_pos: 2}
# ])
# Request.create!([
#   {request_id: 3, rider_id: 0, request_status: "Unassigned", date_time: "2022-10-14 02:07:00", pick_up_loc: "MSC", is_address_BCS: nil, drop_off_loc: "789 That Place Dr", num_passengers: 4, additional_info: "Not drunk"},
#   {request_id: 2, rider_id: 0, request_status: "In Progress", date_time: "2022-10-14 02:07:00", pick_up_loc: "Kyle Field", is_address_BCS: nil, drop_off_loc: "456 Somewhere Lane", num_passengers: 1, additional_info: ""},
#   {request_id: 1, rider_id: 0, request_status: "Late", date_time: "2022-10-14 02:06:00", pick_up_loc: "Zachry", is_address_BCS: nil, drop_off_loc: "123 Anywhere Street", num_passengers: 2, additional_info: "Wearing a green hoodie"}
# ])
Whitelist.create!([
    {email: 'maja9756@tamu.edu'},
    {email: 'externalaffairs.carpool@gmail.com	'},
    {email: 'john001@tamu.edu	'},
    {email: 'joseph.shumway@tamu.edu'},
    {email: 'terry.rughe@gmail.com'},
    {email: 'u.miguel.j@gmail.com'},
])

Whitelist.

# Member.insert_all([
#     {member_id: 1, is_admin: true, is_supervisor: true, email: "terry_ruhge@gmail.com"}
# ])

# Member.create![(
#     {member_id: 1, is_admin: true, is_supervisor: true, leaderboard_points: nil, first_name: "Terry", last_name: "Ruhge", email: "terry.ruhge@gmail.com", password: '123456', address: ' ', phone: '8324616853', emergency_1_phone_number: '8324616853', emergency_1_full_name: 'TerryrRR', emergency_cencrypted_password: "453453453", full_name: "Terry Ruhge", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil}
# )]