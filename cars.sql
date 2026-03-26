CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `article` (`id`, `title`, `summary`, `content`, `created`, `category_id`, `member_id`, `image_id`, `published`) VALUES
(1, '2021 Toyota Camry', 'Dependable family sedan', 'This 2021 Toyota Camry is in excellent condition. It features a fuel-efficient 4-cylinder engine, advanced safety features like lane-keep assist, and a spacious interior perfect for daily commuting.', '2021-01-26 12:21:03', 1, 2, 1, 1),
(2, '2020 Ford Mustang GT', 'V8 American muscle car', 'Experience the thrill of a 5.0L V8 engine. This Mustang GT comes with a 6-speed manual transmission, active valve exhaust, and premium leather track seats for the ultimate driving experience.', '2021-01-28 19:44:03', 3, 2, 2, 1),
(3, '2019 Ford F-150', 'Work-ready full-size pickup', 'Ready for the job site or the weekend getaway. This F-150 XLT includes the towing package, a sprayed-in bedliner, and the powerful EcoBoost V6 engine providing massive torque.', '2021-02-02 09:45:52', 4, 1, 3, 1),
(4, '2022 Chevy Corvette C8', 'Mid-engine supercar', 'A masterpiece of American engineering. The mid-engine C8 Corvette features a roaring V8, magnetic ride control, and an aggressive aerodynamic profile that turns heads everywhere.', '2021-02-12 11:05:35', 3, 3, 4, 1),
(5, '2018 Dodge Challenger', 'Classic muscle styling', 'Retaining the classic muscle car look with modern reliability. This Challenger boasts a spacious cabin, Uconnect infotainment, and a smooth-shifting automatic transmission.', '2021-02-26 15:31:16', 3, 3, NULL, 1),
(6, '2021 Chevy Silverado', 'Heavy duty towing capacity', 'This Silverado 1500 LTZ is fully loaded. It features a luxurious interior, advanced trailering camera systems, and a 5.3L V8 engine capable of pulling heavy loads effortlessly.', '2021-03-02 21:02:47', 4, 1, 6, 1),
(7, '2020 Honda CR-V', 'Compact crossover SUV', 'The perfect balance of space and efficiency. The CR-V offers incredible cargo room, standard all-wheel drive, and Honda Sensing safety technology for peace of mind.', '2021-03-06 10:16:22', 2, 1, 7, 1),
(8, '2022 Toyota RAV4', 'Best selling hybrid SUV', 'Save at the pump with this RAV4 Hybrid. It delivers instant electric torque, standard Apple CarPlay, and an aggressively styled exterior that stands out in the crossover segment.', '2021-03-12 14:45:49', 2, 2, 8, 1),
(9, '2019 Ram 1500', 'Luxury truck interior', 'Winner of truck of the year. This Ram 1500 Laramie features a massive 12-inch touchscreen, heated and ventilated leather seats, and the smooth-riding air suspension system.', '2021-03-12 17:09:40', 4, 1, 9, 1),
(10, '2021 Chevy Camaro', 'Track ready sports coupe', 'The Camaro SS 1LE package is built for the track. It includes upgraded Brembo brakes, recaro performance seats, and a suspension tuned specifically for aggressive cornering.', '2021-03-16 14:14:40', 3, 1, 10, 1),
(11, '2020 Ford Explorer', '3-row family hauling', 'Take the whole family on a road trip. The Explorer seats seven comfortably, offers rear-wheel drive dynamics, and comes equipped with a twin-panel moonroof.', '2021-03-17 18:01:19', 2, 3, 11, 1),
(12, '2019 Honda Accord', 'Premium midsize sedan', 'A sophisticated upgrade to the daily commute. This Accord Touring trim includes a heads-up display, adaptive dampers, and a turbocharged 2.0L engine that is surprisingly quick.', '2021-03-20 11:24:52', 1, 2, 12, 1),
(13, '2021 Toyota Highlander', 'Reliable 3-row SUV', 'Built on a legacy of reliability. The Highlander offers captain\'s chairs in the second row, a quiet cabin, and standard V6 power for highway merging confidence.', '2021-03-21 08:44:01', 2, 2, 13, 1),
(14, '2022 Dodge Charger', '4-door muscle car', 'Practicality meets tire-shredding power. The Charger Scat Pack comfortably fits four adults while packing a 485-horsepower 6.4L Hemi V8 under the hood.', '2021-03-27 13:15:20', 1, 1, 14, 1),
(15, '2018 Toyota Tacoma', 'Off-road midsize truck', 'The undisputed king of midsize resale value. This Tacoma TRD Off-Road includes a locking rear differential, crawl control, and upgraded off-road suspension for hitting the trails.', '2021-04-03 20:36:08', 4, 2, 15, 1),
(16, '2021 Jeep Wrangler', 'Trail rated 4x4', 'Take the doors and roof off for open-air freedom. This Wrangler Rubicon features heavy-duty Dana 44 axles, 33-inch all-terrain tires, and electronic sway bar disconnect.', '2021-04-06 11:21:44', 2, 1, 16, 1),
(17, '2020 Porsche 911', 'Iconic German sports car', 'The benchmark for sports cars. This 911 Carrera features the classic rear-engine layout, a lightning-fast PDK transmission, and timeless styling that never ages.', '2021-04-08 09:46:31', 3, 3, 17, 1),
(18, '2019 Honda Pilot', 'Spacious 8-passenger SUV', 'Essentially a minivan in an SUV body. The Pilot provides an enormous amount of interior volume, multiple USB charging ports, and a reliable V6 engine.', '2021-04-08 18:05:19', 2, 1, 18, 1),
(19, '2021 Toyota Tundra', 'Full size reliable truck', 'Equipped with the legendary 5.7L i-FORCE V8. The Tundra offers massive interior space in the CrewMax cab and a reputation for hitting a million miles with basic maintenance.', '2021-04-11 11:52:02', 4, 2, 19, 1),
(20, '2022 Hyundai Sonata', 'Stylish modern sedan', 'A dramatic design that stands out from the crowd. The Sonata features a digital instrument cluster, remote smart parking assist, and highway driving assist.', '2021-04-15 10:04:39', 1, 2, 20, 1),
(21, '2021 Toyota Supra', 'Turbocharged inline-6', 'A legendary nameplate reborn. The GR Supra delivers razor-sharp handling, a potent turbocharged inline-6 engine, and a driver-focused cockpit.', '2021-04-19 19:08:11', 3, 3, 21, 1),
(22, '2020 Mazda 3', 'Premium compact car', 'Punching above its weight class in luxury. The Mazda 3 features an incredibly quiet interior, premium materials, and engaging driving dynamics unique in the compact segment.', '2021-04-22 08:49:27', 1, 1, 22, 1),
(23, '2019 Chevy Colorado', 'Capable midsize pickup', 'Easier to park than a full-size, but still capable of real work. This Colorado ZR2 is factory-lifted with Multimatic shocks for serious off-roading.', '2021-04-25 13:51:19', 4, 3, 23, 1),
(24, '2021 Nissan Altima', 'AWD daily commuter', 'A comfortable and confident daily driver. This Altima comes with Nissan\'s Intelligent All-Wheel Drive system, making it perfect for navigating bad weather.', '2021-04-25 20:11:42', 1, 1, 24, 1);


CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `navigation` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `category` (`id`, `name`, `description`, `navigation`) VALUES
(1, 'Sedans', 'Standard 4-door passenger cars', 1),
(2, 'SUVs', 'Sport Utility Vehicles and Crossovers', 1),
(3, 'Sports Cars', 'High performance coupes and track cars', 1),
(4, 'Trucks', 'Pickup trucks for towing and hauling', 1);



CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `file` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `image` (`id`, `file`, `alt`) VALUES
(1, 'camry.jpg', 'White Toyota Camry parked on the street'),
(2, 'mustang-gt.jpg', 'Red Ford Mustang GT driving on a track'),
(3, 'f150.jpg', 'Silver Ford F-150 towing a boat'),
(4, 'corvette-c8.jpg', 'Black Corvette C8 parked in front of a building'),
(6, 'silverado.jpg', 'Chevy Silverado driving through mud'),
(7, 'honda-crv.jpg', 'Blue Honda CR-V in a suburban driveway'),
(8, 'rav4-hybrid.jpg', 'Toyota RAV4 Hybrid charging in garage'),
(9, 'ram-1500.jpg', 'Interior shot of the Ram 1500 Laramie dashboard'),
(10, 'camaro-ss.jpg', 'Yellow Chevy Camaro SS doing a burnout'),
(11, 'ford-explorer.jpg', 'Ford Explorer parked at a campsite'),
(12, 'honda-accord.jpg', 'Black Honda Accord driving on highway'),
(13, 'highlander.jpg', 'Toyota Highlander driving through snow'),
(14, 'dodge-charger.jpg', 'Green Dodge Charger Scat Pack'),
(15, 'tacoma-trd.jpg', 'Toyota Tacoma climbing rocks off-road'),
(16, 'jeep-wrangler.jpg', 'Jeep Wrangler with doors removed at the beach'),
(17, 'porsche-911.jpg', 'Silver Porsche 911 Carrera on a mountain road'),
(18, 'honda-pilot.jpg', 'Honda Pilot parked with family packing the trunk'),
(19, 'toyota-tundra.jpg', 'Toyota Tundra TRD Pro in the desert'),
(20, 'hyundai-sonata.jpg', 'Hyundai Sonata driving in the city at night'),
(21, 'toyota-supra.jpg', 'Red Toyota Supra parked on a racing grid'),
(22, 'mazda-3.jpg', 'Grey Mazda 3 Hatchback in the rain'),
(23, 'chevy-colorado.jpg', 'Chevy Colorado ZR2 driving over sand dunes'),
(24, 'nissan-altima.jpg', 'White Nissan Altima driving in light snow');



CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `forename` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `picture` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `member` (`id`, `forename`, `surname`, `email`, `password`, `joined`, `picture`) VALUES
(1, 'Dominic', 'Toretto', 'dom@fastdealership.link', 'c63j-82ve-2sv9-qlb38', '2021-01-26 12:04:23', 'dom.jpg'),
(2, 'Brian', 'Oconner', 'brian@fastdealership.link', 'saq8-2f2k-3nv7-fa4k', '2021-01-26 12:15:18', NULL),
(3, 'Letty', 'Ortiz', 'letty@fastdealership.link', 'sk3r-vd92-3vn1-exm2', '2021-02-12 10:53:47', 'letty.jpg');


ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`member_id`),
  ADD KEY `image_id` (`image_id`);


ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);


ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);




ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;


ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;


ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

 Constraints for table `article`

ALTER TABLE `article`
  ADD CONSTRAINT `category_exists` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `image_exists` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`),
  ADD CONSTRAINT `member_exists` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`);