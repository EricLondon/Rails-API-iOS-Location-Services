### [See blog post here](http://ericlondon.com/2016/10/09/create-an-ios-swift-app-to-send-your-location-to-a-rails-api-and-display-on-google-maps.html).

#### iOS.Swift project

[Swift iOS Location Services](https://github.com/EricLondon/Swift-iOS-Location-Services)

#### Project setup

```bash
git clone
bundle install
rake db:create && rake db:migrate

# add environment variable, ex: ~/.profile
export LOCATION_TRACKER_GOOGLE_API_KEY=yours_not_mine

rails s -b 0.0.0.0
```

#### Sample POST data

```
Started POST "/api/location_payloads" for 10.10.3.110 at 2016-06-30 15:07:22 -0400
Cannot render console from 10.10.3.110! Allowed networks: 127.0.0.1, ::1, 127.0.0.0/127.255.255.255
Processing by Api::LocationPayloadsController#create as */*
  Parameters: {"uuid"=>"SUPER_SECRET_UUID_FROM_IPHONE", "latitude"=>"42.4823224408416", "longitude"=>"-71.1951601493835", "timestamp_at"=>"2016-06-30 19:07:22  0000", "speed"=>"-1.0"}
  User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."email" = $1  ORDER BY "users"."id" ASC LIMIT 1  [["email", "SUPER_SECRET_UUID_FROM_IPHONE@example.com"]]
   (0.1ms)  BEGIN
  SQL (0.4ms)  INSERT INTO "location_payloads" ("latitude", "longitude", "timestamp_at", "speed", "user_id", "address", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING "id"  [["latitude", 42.4823224408416], ["longitude", -71.1951601493835], ["timestamp_at", "2016-06-30 19:07:22.000000"], ["speed", -1.0], ["user_id", 1], ["address", "20 Blanchard Rd, Burlington, MA 01803, USA"], ["created_at", "2016-06-30 19:07:22.885970"], ["updated_at", "2016-06-30 19:07:22.885970"]]
   (1.1ms)  COMMIT
Completed 200 OK in 206ms (Views: 0.1ms | ActiveRecord: 1.9ms)
```

#### Sample model data

```
[1] pry(main)> LocationPayload.where.not(address: nil).last
  LocationPayload Load (1.9ms)  SELECT  "location_payloads".* FROM "location_payloads" WHERE ("location_payloads"."address" IS NOT NULL)  ORDER BY "location_payloads"."id" DESC LIMIT 1
#<LocationPayload:0x007fe6b5ed8ca0> {
              :id => 1727,
      :created_at => Thu, 30 Jun 2016 19:07:51 UTC +00:00,
      :updated_at => Thu, 30 Jun 2016 19:07:51 UTC +00:00,
        :latitude => 42.4822540142623,
       :longitude => -71.1951294383623,
         :address => "20 Blanchard Rd, Burlington, MA 01803, USA",
    :timestamp_at => Thu, 30 Jun 2016 19:07:50 UTC +00:00,
           :speed => 4.63434634594759e-06,
         :user_id => 1
}
```
