QGIS Practical
Prac1: Creating and managing vector data
a. Adding vector layer
b. Setting properties
c. Vector layer formatting
d. Calculating line lengths and statistics
->a-b-c
Step1:
Layer-Create Layer-New Shapefile Layer-click on the 3 dots-Name the file SouthMumbai and save it-Select the Geometry type Polygon-ESPG:4326-Add name (name) to new field-add to field lists-ok
Select yellow pencil and add polygon feature and draw 2 polygons (South & North)
Step2:
Layer-Create Layer-New Shapefile Layer-click on the 3 dots-Name the file highway and save it-Geometry type Linestring- ESPG:4326-Add name (name) to new field-add to field lists-ok
Select yellow pencil and make 4 roads as per u-Right click on the highway-properties-symbology-change the road color 
Step 3:
Layer-Create Layer-New Shapefile Layer-click on the 3 dots-Name the file hospital and save it-Geometry type Point- ESPG:4326-Add name (name) to new field-add to field lists-ok
Select yellow pencil and make hospitals as per u-Right click on the hospitals-properties-symbology-change the road color . Thus u can make many things such as cafe, schools, garden and all but make sure u have to make every new shapefile for every layer
->d
Step1:
Layer-Add layer-Add vector layer-Click the 3 dots-Practical_01/D/IND_rrd/IND_rails.shp-Practical_01/D/IND_adm/IND_adm0.shp-Add-Right click on IND_rails-properties-symbology-simple blue line-ok-
Step 2:
Right click on IND_rails-Open attribute table-Select one row-select yellow pencil-Open field calculator-Output field name-Track_Len/field type-1.2Decimal/Expression- $length/1000-ok
Step 3:
Vector-Analysis Tool-Basic statics for field-InputLayer-IND_rails/fiel to calculate-Track_Len/Statistics report(optional-down) 3dots save the file as output.html and run-click the link

Prac2: Exploring and managing raster data
a.	Adding raster layer
b.	Raster styling and analysis
c.	Raster Mosaicking and clipping
->
a.
Step1:
Layer → Add Layer → Add Raster Layer->
“C:\GIS_Complete_DataSet\Practical_02\A\gl_gpwv3_pdens_00_ascii_one\glds00ag60.asc”
“C:\GIS_Complete_DataSet\Practical_02\A\gl_gpwv3_pdens_90_ascii_one\glds90ag60.asc”
b.
glds90ag60.asc->rightclick->properties->symbology->RenderType(pseducolor), Min(0), Max(240), colorramp(yiord)->classify->apply->ok
glds00ag60.asc (do the same for the next)
Go to Raster → Raster Calculator->Click glds90ag60->OutputLayer(pop_diff), CRS(project CRS), Expression("glds00ag60@1" - "glds90ag60@1")->ok
Remove the other two layers i.e. glds00ag60.asc and glds90ag60.asc
Pop_diff->properties->symbology->RenderType(pseducolor), Min(-20000), Max(6000), Interpolation(Discrete)->ok
c.
Go to Layer → Add Layer → Add Raster Layer->
“C:\GIS_Complete_DataSet\Practical_02\C\India\FAS_India1.2018349.terra.367.2km.tif”
“C:\GIS_Complete_DataSet\Practical_02\C\India\FAS_India2.2018349.terra.367.2km.tif”
“C:\GIS_Complete_DataSet\Practical_02\C\India\FAS_India3.2018350.terra.367.2km.tif”
“C:\GIS_Complete_DataSet\Practical_02\C\India\FAS_India4.2018350.terra.367.2km.tif”
Go to Raster → Miscellaneous → Merge->InputLayers(3dots selectall ok), Merged(3dots savefile mergedfiles)-> run
You can now deselect individual layers from layer pane and only keep the merged raster file.
Go to Layer→ Add Vector Layer → “C:\GIS_Complete_DataSet\Practical_02\C\India\IND_adm.zip”
RightClick->properties->symbology->blue outline
Go to Raster → Extraction → Clip Raster by Mask Layer->InputLayer(mergedfiles)->Scroll down->AdvancedParameters(3dots savefile clipped)->run

Prac3: Making a map
a.	Working with attributes
b.	Importing spreadsheets or CSV files
c.	Using plugins
d.	Searching and downloading OpenStreetMap data
->
a.
Layer->VectorLayer-> Choose all the .shp files “C:\GIS_Complete_DataSet\Practical_01\D\IND_adm\IND_adm1.shp”
“C:\GIS_Complete_DataSet\Practical_01\D\IND_rrd\IND_rails.shp
Go to Project → New PrintLayout-> Practical_3A-> A new Print Layout window will open
Select Add Item → Add Map->Select the white area fully->Slide the Map1 to the rightside and lock->Zoom to the mumbai region->AddITem->AddMap
Go to Add Item → Add North Arrow
Select the Map 1->item Properties->Overviews->Plus symbol->MapFrame(Map2)
Add Item → Add Label->Write->Mumbai Map
Add Item → Add Legend
Add Item → Add Scale Bar
Add Item → Add Label→Add a Label using HTML rendering->( <h2>&copy; Copy Rights Reserved<h2><br><h1>BSC IT Student</h1>), Check rendering as html
Layout->Export as image->Save->600dpi->Save

b.
Go to Layer → Add Layer → Add Delimited text Layer
“C:\GIS_Complete_DataSet\Practical_03\B\Sample.csv”
FileFormat(Tab, Colon, Space), GerometryDef(Xfield-longitude, Yfield-latitude), CRS(4326)->ok 

Prac4: 
a.	Working with attributes
b.	Terrain data and hill shade analysis
->
a.
Go to Layer → Add Layer → Add Vector Layer->
“C:\GIS_Complete_DataSet\Practical_04\A\ne_10m_populated_places_simple.zip”
Layer->Open Attribute Table->SelectByExpression->Experssion(pop_max > 100 and pop_max < 1000)-> Select Features
For India (pop_max>100 and pop_max<10000 and "sov0name"='India')
b.
Go to Layer → Add Raster Layer →
“C:\GIS_Complete_DataSet\Practical_04\B\GMTED2010N10E060_300\10n060e_20101117_gmted_mea300.tif”
Zoom towards the right top corner
Go to Raster → Extraction→ Clip Raster by Extent->InputLayer(10n60..), ClippingExtent(click use canva), Clipped(3dots savethefile clipped)->run
Deselect the original layer and keep the clipped one.
Go to Raster → Extraction→ Contour->InputLayer(clipped), IntervalBetween(100), AttributeName(3dots savefile Himalaya)->Run
Diselect the Clipped
Himalay->properties->Labels(SingleLabel)->Value(1.2ELEV)->Symbology->SingleSymbol-Width(0.20000)->ok
Himalay->AttributeTable
Layer->Saveas->Format(Keyholemarkuplang)->Filename(3dots savefile Himalaya.kml)->ok
Go to Raster → Analysis → Hill Shade->InputLayer(clipped), Scale(1), Azimuth(315), Altitude(43)->AdvancedHillshade(3dots savefile HillShade)->Run

Prac5: Working with projections and WMS data
->
Layer → Add Layer →Vector Layer->
“C:\GIS_Complete_DataSet\Practical_05\A\ne_10m_admin_0_countries.zip”
Go to Layer → Save As->Format(ESRI Shapefile), Filename(3dots savefile projected),CRS(102008)->ok
Deselect the original Image and keep the projected layer visible
Select Layer → Add Layer → Add Raster Layer->
“C:\GIS_Complete_DataSet\Practical_05\A\minisc_gb\minisc_gb\data\RGB_TIF_compressed\MiniScale_(standard)_R17.tif”
Project->properties->CRS(27700)	

Prac6: Georeferencing 
a.	Georeferencing topo sheets and scanned maps
b.	Georeferencing aerial imagery
c.	Digitizing map data
->
a.
Go to Layers → Add Layer → Add vector Layer->
“C:\GIS_Complete_DataSet\Practical_06\A\IND_adm\IND_adm0.shp”
Zoom in to Mumbai region in the layer
Go to Plugins→ Manage and Install Plugins-> install Georeferencer GDAL plugin
Go to Layer → Georefrencer->OpenRaster->BombayMap->Edit->Add GCP points->Add 4 points->Setting->TranformationSetting->Tranformation(ThinPlate), TargetCRS(4326)->ok->Run->Lowe the transperancy 

b.
Go to Web Menu → OpenLayerPlugin → OpenStreetMap→ OpenStreetMap
View->Panel->OSM Search
Go to Project → Properties → Set CRS to EPSG 3857
The Gateway of India, Mumbai is located at 18.92°N 72.83°E
Go to Layer → Georefrencer->OpenRaster-> Select file “Gateway_Imagery.tif” from project data folder
Add GCP points:.4 points->Settings->Tranformations-> Tranformation(ThinPlate), TargetCRS(ProjectCRS 3857)->ok->Run->Lowe the transperancy 

c.
Go to Layer ‣ Add Raster→ “C:\GIS_Complete_DataSet\Practical_06\C\Christchurch Topo50 map.tif”
RightClick->properties->pyramids->selectall build run ok
View->Toolbar->Snapping toolbar->Select magnet->Select vertex and segment
Go to Layer → create Layer → Add Spatialite Layer->LayerNAme(Digitized_Road), Geometery(line), CRS(4167)
Yellow pencil->Line feature->Make road
Go to Layer → create Layer → Add Spatialite Layer->LayerNAme(Digitized_Garden), Geometery(polygon), CRS(4167)

Prac7: Managing data tables and spatial data sets
a.	Table joins
b.	Spatial joins
c.	Points in polygon analysis
d.	Performing spatial queries
a.
Go to Layer → Add Layer → Add new Vector Layer->
“C:\GIS_Complete_DataSet\Practical_07\A\tl_2013_06_tract.zip”
Go to Layer → Add Layer → Add Delimited Text Layer->
“C:\GIS_Complete_DataSet\Practical_07\A\ca_tracts_pop.csv”
FileFormat(semicolon, comma), No geometry coordinates->add
tl_2013_06_tract->properties->joins->+->JoinLayer(ca_tracts_pop), JoinField(GEO.id2), TargertField(GEOID)
Symbology->Graduated->Value(ca_tracts_pop_D001)->Colorramp change->Mode(Equal Interval)->ok run

b.
Go to Layer → Add Layer → Add Vector Layer →
“C:\GIS_Complete_DataSet\Practical_07\B\nybb_13c_av\nybb.shp”
“C:\GIS_Complete_DataSet\Practical_07\B\OEM_NursingHomes_001.shp”
Go to Vector → Data Management Tools → Join Attributes by Location->
JoinToFeatures(nybb), ByComapring(OEM)->FieldsToAdd(3dots selectall ok)->run
Go to I and check output

c.
Go to Layer → Add Layer → Add Delimited Text Layer->
“C:\GIS_Complete_DataSet\Practical_07\C\EarthQuakeDatabase.txt”->
FileFormat(tab), GeometryDef(Xfield-longitude and yfield-latitude)
Go to Layer → Add Layer → Add Delimited Text Layer->
“C:\GIS_Complete_DataSet\Practical_07\C\ne_10m_admin_0_countries.zip”
GeometryDef(Xfield-field_1 and Yfield-field_2)
Vector->Analysis Tools->Count Points in polygon->Polygons(3dots select the ne_10_admin…countries.shp), Points(EarthQuakeDatabase), Weight(Location_name), classfield(Country),Count(3dots savefile EarthquakeCountry)->run
Select I and run the program

d.
Go to Layer → Add Layer → Add Vector Layer->
“C:\GIS_Complete_DataSet\Practical_07\D\ne_10m_populated_places_simple.shp”
“C:\GIS_Complete_DataSet\Practical_07\D\ne_10m_rivers_lake_centerlines.shp”
Project->Properties->CRS(54032)
Go to Vector → Geoprocessing Tool → Buffer->InputLayer(centerlines), Distance(0.02), Buffered(3dots savefile river_bufferr.shp)->run
Go to Vector → Research Tool → Select By Location->SelectFeatures(river_buffered), Bycomparing(simple_places)->run

1.Perform Nearest neighbor analysis to find the nearest earthquake prone area located near a populated place. [Hint: use signif.txt and ne_10m_populated_places_simple.shp](Prac8)
Step1:-
Go to Layer → add Layer → add Delimited Text Layer and load “C:\GIS_Complete_DataSet\Practical_08\A\EarthQuakeDatabase.txt” from data file.
FileFormat(Select Tab, Colon, Comma, Custom delimiters) RecordFilesAndOptions(Check both the checkbox) GeometryDefinition(PointCoordinates, Xfield-Longitude & Yfield-Latitude)
Step2:
Go to Layer → Add Layer → Add vector Layer and from data folder “\GIS_Workshop\Practicals\Practical_08\A\DATA\ne_10m_populated_places_simple.zip” load the layer to the project and remove all rows from attribute table other than India.
Step3:
Go to Vector→ Analysis tool → Distance Matrix
InputPointLayer(EarthQuakeDatabase), InputUniqueIdField(Location_name), TargetPointLayer(ne_10m…), TargetUniqueIdField(name), DistanceMatrix(Save the file to the Matrix.csv)

2.Add the following layers in QGIS EarthquakeDatabase.txt 
ne_10m_admin_0_countries.shp Calculate the total earthquakes / Tsunami occurred in each country. Show the total number of earthquake / Tsunami occurred in India. (Prac 7c)
Step1:
Go to Layer → Add Layer → Add Delimited Text Layer Select “C:\GIS_Complete_DataSet\Practical_07\C\EarthQuakeDatabase.txt”
(Tab/CustomDelimiters/ Geometry Xfield-longitude & Yfield-latitude/ CRS-4326)
Step2:
Go to Layer → Add Layer → Add Vector Layer “C:\GIS_Complete_DataSet\Practical_07\C\ne_10m_admin_0_countries.shp”
Vector->Analysis Tools->Count points in polygon->Polygons “ne_10m_admin_0_countries” Points “EarthQuakeLayer” Weight field “LocationName” Class field “Country” Count “EasrthQuakeCount” and save the file->Run
Step3:
Use i button to see the output-> Find Total Earthquakes in India-> Open the Attribute Table of the result layer-> Use the Select by Expression tool->Write "NAME" = 'India' in expression->Click select

3.Import "sample.csv" or "EarthquakeDatabase.txt" file in a new QGIS project. Using attribute 
table perform the following tasks 
Format "Tsunami" with red color and others using black color symbol. 
Show the place with highest number of death value. 
Show the places where Tsunami occurred for highest time in terms of hours. 
Show all the Natural calamities that occurred in India 
Show all the places where Tsunami occurred between 2000 and 2019. 
Step1:
Go to Layer → Add Layer → Add Delimited text Layer
Select the “GIS_Workshop\Practicals\Practical_03\C\Sample.csv” file from data folder.
FileFormat(CustomDelimiters Check-Tab-Colon-Space), RecordFieldsOptions(SelectBoth), GeometryDef(PointCoordinates-Xfield”Longitude” Yfield”Latitude”), CRS(4326)->Add
Step2: Format “Tsunami” with Red Color and Others Black
Right-click the layer → Properties->Click Symbology->Change Single Symbol to Categorized->In Value, select the column Disaster_Type / Tsunami->Click Classify->(Set Tsunami → Red color, Set Others → Black color)->Click Apply → OK.
Step3: Show the Place with Highest Number of Death Value
Open Attribute Table->Click Select by Expression ("Tsunami" = 'Yes')-> Click Select Features
Step4: Show All Natural Calamities in India
Open Attribute Table->Click Select by Expression("Country" = 'India')-> Click Select Features
Step5: Show Places Where Tsunami Occurred Between 2000–2019
Open Select by Expression->Use the query(“Tsunami” = ‘Yes’ AND “Year” >= 2000 AND “Year” <= 2019->Click Select Features

4. Add the following layers in QGIS 
EarthquakeDatabase.txt 
ne_10m_admin_0_countries.shp. Calculate the total earthquakes / Tsunami occurred in each country. Show the total number of earthquake / Tsunami occurred in India. (Prac7c) 
Step1:
Go to Layer → Add Layer → Add Delimited Text Layer
“C:\GIS_Complete_DataSet\Practical_07\C\EarthQuakeDatabase.txt”-> In Geometry 
Step1:
Click Layer → Add Layer → Add Delimited Text Layer-> “C:\GIS_Complete_DataSet\Practical_07\C\EarthQuakeDatabase.txt”-> In Geometry Definition choose Point Coordinates->Xfield-Longitude and Yfield-latitude, CRS-4326->
(only tab checkbox)->Add
Step2:
Click Layer → Add Layer → Add Vector Layer->Select “C:\GIS_Complete_DataSet\Practical_07\C\ne_10m_admin_0_countries.shp”->Add
Step3:
Vector->AnalysisTools->CountsPointsinpolygon(Polygons “ne_10m..”, Points “EarthQuakeLayer”, WeightField “Location_Name”, ClassField “Country”, Countfield_name “EarthQuake_Count.shp” Save the file->run
Step4: Calculate Total Earthquakes/Tsunami per Country
Open Processing ->Toolbox->Search(Join attributes by location)-> Input Layer(ne_10m_admin_0_countries), Join Layer(EarthquakeDatabase), Geometric Predicate(contains), Summaries to Calculate(count)->Run
Step5: Show Total Earthquakes/Tsunami in India
Open Attribute Table->Click Select by Expression->Write("NAME" = 'India')-> Click Select Features

5.Open "Open Street Map" Search "University of Mumbai Fort Campus" Geo-reference the aerial image of University of Mumbai Fort Campus. (Hint: use Image from required Files) (Prac3d)
Step1:
Install plugin OpenStreetMap ➢ Go to Web Menu → OpenLayerPlugin →OpenStreetMap→ OpenStreetMapBrowser->XYZTiles->OSM
Step2:-
Go to Project → Properties → Set CRS to EPSG 3857 (no crs)
Go to View → Panels → select OSM Place search->University of Mumbai->zoom
Step3:
Layer-GeoReferencer->File->OpenRaster->import the .tif image
Edit->Add GCP points->Add 4 points in both the maps->Settings->TransformationSettings->TransformationType(ThinPlate), TagertCRS(3857), OutFile(GatewayImagery_modified) save the file->ok->Press green run btn

6.Using spatial query find the places those are approximately located within 2 KM 
region of river. Show locations from India region (Prac7d)
Step1:
Go to Layer → Add Layer → Add Vector Layer and load
C:\GIS_Complete_DataSet\Practical_07\D\ne_10m_rivers_lake_centerlines.shp
C:\GIS_Complete_DataSet\Practical_07\D\ne_10m_populated_places_simple.shp
Step2:
project Properties → Set CRS “World_Azimuthal_Equidistant EPSG 54032
Step3:
Go to Vector → Geoprocessing Tool → Buffer
InputLayer(ne_10m_..), Distance(2), Buffered(save the file in the .shp exe)->Run
Step4:
Go to Vector → Research Tool → Select By Location->SelectFeatures(River_Buffer), intersect(checkbox), ByComparingTo(populated-places_simple)->Run

7. Open Ind_adm0.shp file in QGIS and locate Mumbai region. Geo-reference the Mumbai Scan . Map at appropriate location. (Hint: use Image from required Files) (Prac6a)
Step1:
Go to Layers → Add Layer → Add vector Layer-> “C:\GIS_Complete_DataSet\Practical_06\A\IND_adm\IND_adm0.shp”
Step2:
Zoom in to Mumbai region in the layer->Go to Plugins→ Manage and Install Plugins->
install Georeferencer GDAL plugin
Step3:
Layer → Georefrencer->File->Openraster->Open “Bombay_1909.jpg”
Edit->Add GCD points->Add 4 points->Go to Settings →Transformation Settings->TransformationType(ThinPlateSpine), CRS(4326), OutputFile(C:\GIS_Complete_DataSet\Practical_06\A\Bombay_1909_modified10.tif) save the file, ResamplingMethod(nearest neigbour)->Run->Properties->TransperncyLow

8.Create a map of your own residential area 
1. Add 4 Area (id, name) 
2. Add 4 Garden (id, name) 
3. Add 2 Highways (id, name) 
4. Add 2 railway track (id, name, line) 
5. Add 5 Railway stations(id, name, line) 
6. Add 5 Restaurants (id, name) [At least 2 should be inside any garden] 
7. Add 5 Hospitals 
8. Add 10 Building/residential compound / Business Park. 
Step1:
Click Layer → Create Layer → New Shapefile Layer->Geometry:Polygon->Right-click Area layer → Toggle Editing->Click Add Polygon Feature->Draw 4 polygons on the map(Residential Area, Market Area, School Area, Business Area)
Step2: Create Garden Layer
Layer → Create Layer → New Shapefile Layer->Geometry: Polygon-> Draw 4 polygons on the map(Central Garden, Children Park, Lake Garden, Community Park)
Step3: Create Highways Layer
Layer → Create Layer → New Shapefile Layer->Geometry: Line->Draw 2 highways (Western Highway, Eastern Express Highway)
Step4: Create Railway Track Layer
Layer → Create Layer → New Shapefile Layer->Geometry: Line-> 2 railway tracks(Western Railway, Central Railway)
Step5: Create Railway Stations Layer
Layer → Create Layer → New Shapefile Layer->Geometry: Point-> (Andheri, Dadar,etc)
Step6:- Create Restaurants Layer
Layer → Create Layer → New Shapefile Layer->Geometry: Point->( Garden Café, etc)
Step7: Create Hospitals Layer
Layer → Create Layer → New Shapefile Layer->Geometry: Point
Step8: Create Buildings Layer
Layer → Create Layer → New Shapefile Layer->Geometry: Polygon

9.Perform the following queries on above layers 
1. Add a new column Garden_area and calculate the area of each garden 
2. Show the largest garden. 
3. Show all the railway tracks that intersect with Highways. 
4. Find all the restaurants inside a garden. 
5. Find all the railway tracks that do not intersects with highway 
Step1: Add Column Garden_area and Calculate Area of Each Garden
Open Attribute Table->Right-click Garden layer->Click Open Attribute Table->Open Field Calculator->Click Field Calculator icon->Create New Field->Output Field Name(Garden_area), Output Field Type(Decimal), Expression($area)->OK->Now each garden polygon will have its area calculated.
Step2: Show the Largest Garden
Open Garden Attribute Table->Click the Garden_area column->Click Sort Descending->The first row is the largest garden
Step3: Show Railway Tracks that Intersect Highways
Go to Vector → Research Tools → Select by Location->Select features from(RailwayTracks), By comparing to(Highways), Geometric Predicate(intersects)->Run
Step4: Find All Restaurants Inside a Garden
Go to Vector → Research Tools → Select by Location->Select features from(Restaurants), By comparing to(Garden), Geometric Predicate(within)->Run
Step5: Find Railway Tracks that Do NOT Intersect Highways
Open Select by Location again->Select features from(Railway Tracks), By comparing to(Highways)->Run
Click Invert Selection (in attribute table or selection menu)

11. Add vector layers, use this file "\IND_rails.shp and \IND_adm0.shp" from database, set all appropriate properties, formatting and calculate line lengths and statistics with total area covered by water bodies in India. (Prac1d)
Step1:
Layer-Add layer-Add vector layer-Click the 3 dots-Practical_01/D/IND_rrd/IND_rails.shp-Practical_01/D/IND_adm/IND_adm0.shp-Add-Right click on IND_rails-properties-symbology-simple blue line-ok-
Step 2:
Right click on IND_rails-Open attribute table-Select one row-select yellow pencil-Open field calculator-Output field name-Track_Len/field type-1.2Decimal/Expression- $length/1000-ok
Step 3:
Vector-Analysis Tool-Basic statics for field-InputLayer-IND_rails/field to calculate-Track_Len/Statistics report(optional-down) 3dots save the file as output.html and run-click the link
IF File is possible
Step4: Calculate Area of Water Bodies in India
Click Layer → Add Vector Layer-> Select water body shapefile (example: lakes.shp)-> Open Attribute Table of water layer-> Open Field Calculator-> Field Name(Water_Area), Field Type->( Decimal), Expression($area)->Ok-> Right-click Water_Area column-> Click Statistics

12.Add raster layers, use "gl_gpwv3_pdens_90_ascii_one\glds90ag60.asc" (Prac2a&b)
Step1:
Layer → Add Layer → Add Raster Layer->”C:\GIS_Complete_DataSet\Practical_02\A\gl_gpwv3_pdens_90_ascii_one\glds90ag60.asc”
“C:\GIS_Complete_DataSet\Practical_02\A\gl_gpwv3_pdens_00_ascii_one\glds00ag60.asc”
Go to Project → Properties->CRS(4326)
Step2:
Select “glds90ag60.asc” Rightclick→property->Symbology->RenderType(pseudocolor), min(0), max(240), colorramp(yiorrd), classify click->Apply->ok
Select “glds00ag60.asc” Rightclick→property->Symbology->RenderType(pseudocolor), min(0), max(240), colorramp(yiorrd), classify click->Apply->ok
Step3:
Go to Raster → Raster Calculator->Click glds90ag60@1->OutputLayer(pop_diff),OutputCRS(ProjectCRS), Write the expression ("glds00ag60@1" - "glds90ag60@1")
Select the output file location & name and Press OK
Remove the other two layers i.e. glds00ag60.asc and glds90ag60.asc
Double click on pop_diff layer->properties->Symbology->RenderType(pseducolor), Min(-20000), Max(6000), Interpolation(Discrete), Labelprecision(4), Mode(continuous), classify->Apply->ok

13.Add ne_10madmin_0_countries.zip layer: 
1. Save with shape file 
2. Add raster layer with R17.tif 
3. Set appropriate properties and show output with grid EPSG 27700. (Prac5)
Step1:
Layer → Add Layer →Vector Layer-> “C:\GIS_Complete_DataSet\Practical_05\A\ne_10m_admin_0_countries.zip”
Go to Layer → Save As->Format(ESRI Shapefile), FileName(myproject,shp)3dots and save, CRS(102008)->ok
Deselect the original Image and keep the projected layer visible
Step2: 
Select Layer → Add Layer → Add Raster Layer → Select MiniScale_(standard)_R17.tif from Location
Project->Properties->CRS(27700)->ok
Locate United Kingdom on Layer; the vector layer exactly coincides by the raster layer covering United Kingdom.

14.Open "Open Street Map" 
Search "Statue of Unity" Geo-reference the aerial image of Statue of Unity Region. (Hint: use Image from required Files) Demonstrate the projection of WMS map. 

15.Open "Open Street Map" 
Search "University of Mumbai Fort Campus" 
Geo-reference the aerial image of University of Mumbai Fort Campus. (Hint: use Image from required Files) 

16. Import "10n060e_20101117_gmted_mea300.tif" raster data which represent surface 
elevations map of India. To study the elevation of hilly area of North India, extract the required Raster area by Extent. Perform Hill Shade surface analysis using the above elevation map. 

17.Add Mumbai map and highlight the all Chowpatty in Mumbai. 

18.Create a 3-vector layer to store points representing locations: college, restaurant, hospitals. 
1. Add roads and railway tracks. 
2. Change the color and size of point markers on vector layer to visually differentiate between categories of restaurants. 

19. create a map from above layers: add label, legend, scale, Add a suitable title with proper formatting. 

20.Create vector layer for your residential layer. Add required data to demonstrate the join attribute by location. To show the count points in polygon by using analysis tools. (Prac7b&c)	 
21.Create a map based on following assumptions 
1. Add 1 Highways (id= "375") 
2. Add 6 Farms (id, own_name) (2 farms near Highway) 
3. Add 4 narrow Paths between farms (id) 
4. Add a main road that passes near farms and touches the highway. 
5. Add 2 Farm houses in any two farms (id, frm_id). 
6. Add 4 Residential areas. (at-least one near farm and one near main road) 
7. Add two Primary Schools 
8. Add a Bus stop and an Auto Stand near a main road. 
9. Add a Grampanchayat office 
10. Add 4 wells (3 in farms and 1 in residential area) 

23.Create a map of Railway route CST to Chembur including the building adjacent rails. Use any 7 layers and show stations. Create dataset for all layers. (prac3)

24.Open Ind_adm0.shp file in QGIS Geo-reference the Indian Political Map at appropriate location. (Hint: use Image from required Files) (Prac6a)

25. Import "10n060e_20101117_gmted_mea300.tif" raster data which represent surface 
elevations map of India. To study the elevation of hilly area of North India, extract the required Raster area by Extent. Perform Terrain analysis using the above elevation map. 
(Prac4b) 

26. Import "10n060e_20101117_gmted_mea300.tif" raster data which represent surface  
elevations map of India. To study the elevation of hilly area of North India, extract the required Raster area by Extent. Perform Hill Shade surface analysis using the above elevation map. (Prac4b)

27.Import "10n060e_20101117_gmted_mea300.tif" raster data which represent surface 
elevations map of India. To study the elevation of hilly area of North India, extract the required Raster area by Extent. Perform Terrain analysis using the above elevation map. (Prac4b)

29.Open "Open Street Map" 
Search "University of Mumbai Fort Campus" 
Geo-reference the aerial image of University of Mumbai Fort Campus. 
Geo-reference the aerial image of Church gate Region. (Hint: use Image from required Files) 

30.Import "10n060e_20101117_gmted_mea300.tif" raster data which represent surface 
elevations map of India. To study the elevation of hilly area of North India, extract the required Raster area by Extent. Perform Terrain analysis using the above elevation map. (Prac4b)

31.Create a Road map and add vector layer from Vashi to thane route. Use google map and add dataset to the layer. 
Step:
Add OSM map->OSM PlaceSearch->Vashi->create layer->new shapefile->linestring

32.Create vector layer of your own residential area and highlighted buildings, hospitals, and temple with the formatting. 
Step1:
Add OSM map->Zoom Mumbai->layer->createlayer-new shapefile->Geometry(point), CRS(4326)->yellow pencil-> make point-> make layer for each point

10.Create a Map using above layers Add the following 
1. Add a North Pointer 
2. Add Legend and Scale 
3. Use "any "Symbol to indicate hospitals. 
4. Use a symbol indicating Metro station for one of the railway stations. 
5. Save your map in JPEG format with 1500 dpi of resolution 

