# CASSIE: Curve and Surface Sketching in Immersive Environments

This is the source code and Unity Project for our CHI 2021 paper. This Unity app was used for our user study, as well as to create all sketches displayed in the paper and accompanying videos.

We additionally provide a good variety of sketch export options (polylines of input and neatened sketch, curve network connectivity data), which could be useful for future research projects that need a simple way to generate 3D sketches data to test their methods on.

Please check out our project for more information: [[Project page]](https://em-yu.github.io/research/cassie/), [[Paper]](http://www-sop.inria.fr/reves/Basilic/2021/YASBS21/CASSIE_author_version.pdf)

This is research code, expect bugs and performance issues. If you are interested in using the project and need help setting up or adapting it, you can [contact us](mailto:emilie.yu@inria.fr).

If this is useful for your research, please [cite us](/#citing-this-project).

## Installation

* Install Unity 2019.3.9f1 from [Unity's website](https://unity3d.com/fr/get-unity/download/archive). The app was not tested with other versions of Unity, and will be incompatible with newer versions of Unity such as 2020, due to us using the legacy VR input system.
* Install SteamVR if you do not have it already. This is necessary to have the input from VR headset and controllers working. We provide bindings for HTC Vive Wand, Oculus Touch controllers, Valve Knuckles. If you have another type of controller that is supported by SteamVR you should be able to setup your own bindings through the SteamVR 
* Clone this repository. (Warning: downloading the repository from gitlab UI instead of cloning leads to the files stored with git LFS to be missing, which will cause build problems.)
* Open the Unity project with 2019.3.9f1. Find the correct scene in `Assets > Scenes > VRSketching` and doucle-click it.
* You are ready to build and play the project.

### Settings

#### Set up controller type and dominant hand

* Go to `Assets/StreamingAssets`
* Open `controller_type.txt` and set your controller type (this is used to display a controller specific cheatsheet with all the controls in the VR scene, controller binding is setup automatically through SteamVR)
  * 0 = HTC Vive
  * 1 = Oculus
  * 2 = Valve
* Open `dominant_hand.txt` and set your dominant hand:
  * 0 = right-handed
  * 1 = left-handed

#### Customize system settings

You can try out different system settings (eg: distance thresholds for intersection detection) than those we chose in the paper, by creating your own `ScriptableObject`:

* In your project (for example in `Assets/Parameters`) `right-click > Create > CASSIE Parameters`. Customize the values.
* Change the parameters currently used in the Unity app: in the scene, find the `Parameters` GameObject. Under the script `CASSIE Parameters Provider` drag your new Parameters ScriptableObject under `Current Parameters`.
* The default values are the ones we used in the paper and user study. A detailed description of each parameter (units and effect) is provided, hover over the name to display the description.
* You can always come back to default parameters by dragging the ScriptableObject `Default CASSIE Parameters` to the `Parameters` GameObject.

## How to use the sketching application

These instructions are valid both in Debug mode (while playing from the editor) and in a build.

### Sketching

* In the VR scene, you should see a cheatsheet that displays the available controls on your controller (if you don't see you controller type, you need to set the correct controller type, see above). The blue dot corresponds to the dominant hand, and the grey dot corresponds to the non-dominant hand. You can also find the cheatsheet for all 3 controller types [here](http://www-sop.inria.fr/members/Emilie.Yu/Controllers-cheatseet.pdf).
* For a detailed tutorial, you can watch the [instructions video](https://youtu.be/Z2JEOQJK8cg) for the remote user study we ran. There are a few irrelevant bits, such as information about the study task itself and how to send data back to us, please use the time labels to skip those.

### Exporting a sketch

* At any time during a sketch you can export your current sketch by pressing `X` on the keyboard. This will not delete your current sketch.
* You can also press the `Next` button on the VR controller (see cheatsheet), which will save your current sketch data and clear the scene.

When exporting multiple data files are created (the file naming convention may vary slightly, with a `system` ID in the name when exporting from the `Next` button):

* `[timestamp]_([system])_strokes.obj`: an OBJ file with a mesh corresponding to the strokes in the current sketch, rendered as tubular meshes.
* `[timestamp]_([system])_patches.obj`: an OBJ file with a mesh corresponding to the surface patches in the current sketch. Please note that we don't export normals, and the triangle orientations are arbitrary (do not cull back-facing triangles to render in eg. Blender).
* `[timestamp]_([system]).curves`: a file that stores all strokes in the current sketch as polylines. This is designed as a super easy format to import in other systems that treat 3D polylines. Please checkout our [data repository](https://gitlab.inria.fr/D3/cassie-data) to find example scripts to import this file format.
* `[timestamp]_([system])-input.curves`: a file that stores the input samples captured for all strokes in the current sketch as polylines. Same format as before, but stores the strokes without any neatening.
* `[timestamp]_([system])_graph.json`: a file that stores the graph data structure of the current sketch. Please refer to the [data repository](https://gitlab.inria.fr/D3/cassie-data) to find a description of this file format and example scripts to read the data with Python and visualize it.
* `[timestamp]_[system].json`: you will only have this file when exporting with `Next` on the controller. This is a log of the entire sketching session, which we used to analyze data from the remote user study. Most probably useless for future use cases.

You can choose which file formats among those you wish to have at export by editing the script attributes in `ExportController` in the scene. All file formats are active by default. You can also customize whether the scene should be cleared after export or not (default is: not clearing the scene).

## Limitations, known issues



## Citing this project

```latex
@InProceedings{YASBS21,
  author       = "Yu, Emilie and Arora, Rahul and Stanko, Tibor and Bærentzen, J. Andreas and Singh, Karan and Bousseau, Adrien",
  title        = "CASSIE: Curve and Surface Sketching in Immersive Environments",
  booktitle    = "ACM Conference on Human Factors in Computing Systems (CHI)",
  year         = "2021",
  url          = "http://www-sop.inria.fr/reves/Basilic/2021/YASBS21"
}
```

