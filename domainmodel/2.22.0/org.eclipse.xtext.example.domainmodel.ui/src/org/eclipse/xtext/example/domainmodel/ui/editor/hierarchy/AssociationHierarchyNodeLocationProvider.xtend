/*******************************************************************************
 * Copyright (c) 2016, 2018 itemis AG (http://www.itemis.eu) and others.
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License 2.0 which is available at
 * http://www.eclipse.org/legal/epl-2.0.
 *
 * SPDX-License-Identifier: EPL-2.0
 *******************************************************************************/
package org.eclipse.xtext.example.domainmodel.ui.editor.hierarchy

import com.google.inject.Singleton
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EStructuralFeature
import org.eclipse.xtext.example.domainmodel.domainmodel.Property
import org.eclipse.xtext.ide.editor.hierarchy.DefaultHierarchyNodeLocationProvider

import static extension org.eclipse.xtext.EcoreUtil2.*

/**
 * @author kosyakov - Initial contribution and API
 */
@Singleton
class AssociationHierarchyNodeLocationProvider extends DefaultHierarchyNodeLocationProvider {

	override getTextRegion(EObject owner, EStructuralFeature feature, int indexInList) {
		val property = owner.getContainerOfType(Property)
		if (property !== null) {
			val textRegion = locationInFileProvider.getFullTextRegion(property)
			return property.toTextRegionWithLineInformation(textRegion)
		}
		return super.getTextRegion(owner, feature, indexInList)
	}

}