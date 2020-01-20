"
I am a baseline to define the structure and dependencies of the SpecAppSkeleton project.
"
Class {
	#name : #BaselineOfSpecAppSkeleton,
	#superclass : #BaselineOf,
	#category : #BaselineOfSpecAppSkeleton
}

{ #category : #baseline }
BaselineOfSpecAppSkeleton >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'SpecAppSkeleton'.
			"Groups"
			spec
				group: 'Core' with: #('SpecAppSkeleton')].
]

{ #category : #accessing }
BaselineOfSpecAppSkeleton >> projectClass [
	^ MetacelloCypressBaselineProject
]
